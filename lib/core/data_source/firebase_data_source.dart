import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/place_entry/data/model/place_settings/place_settings_model.dart';
import '../../features/place_menu/data/model/place_menu_item_model.dart';
import '../../features/place_menu/data/model/place_menu_model.dart';
import '../../features/place_plan/data/model/place_plan/place_plan_level_model.dart';
import '../../features/place_plan/data/model/place_reservation/place_reservation_model.dart';
import '../../features/place_search/data/model/place_search_model.dart';
import '../../features/reservation_chat/data/model/chat_message_model.dart';
import '../error/exceptions.dart';
import '../place_order/data/model/place_order_model.dart';
import '../util/globals.dart';

abstract class FirebaseDataSource {
  Future<List<PlaceSearchModel>> fetchPlaces();
  Future<File> fetchPanorama(String placeId, String elementId);
  Future<List<PlacePlanLevelModel>> fetchPlacePlan(String placeId);
  Future<PlaceSettingsModel?> fetchPlaceSettings(String placeId);
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId);
  Future<void> submitOrder(PlaceOrderModel placeOrderModel,
      String? reservationId, ChatMessageModel orderMessageModel);
  Future<void> submitReservation(PlaceReservationModel placeReservationModel);
  Future<void> addChatMessage(
      String reservationId, ChatMessageModel chatMessageModel);
  Stream<List<PlaceOrderModel>> fetchOrders(
      {String? placeId, String? userId, String? reservationId});
  Stream<List<PlaceReservationModel>> fetchReservations(
      {String? placeId, DateTime? reservationDate, String? userId});
  Future<void> changeStatus(String reservationId, String closeStatus, String closedBy);
  Stream<List<ChatMessageModel>> fetchChatMessages(
      String placeId, String reservationId);
}

class FirebaseDataSourceImpl extends FirebaseDataSource {
  late final FirebaseFirestore ff;
  late final FirebaseStorage fst;

  FirebaseDataSourceImpl() {
    ff = FirebaseFirestore.instance;
    fst = FirebaseStorage.instance;
  }

  @override
  Future<List<PlaceSearchModel>> fetchPlaces() async {
    QuerySnapshot<Map<String, dynamic>> placesSnapshot =
        await ff.collection(pathPlaces).get();


    List<PlaceSearchModel> models =  placesSnapshot.docs
        .map((value) => PlaceSearchModel.fromJson(value.id, value.data()))
        .toList();

    await Future.forEach(models, (element) async {
      await _readImagesInFolder(
          '${element.placeId}/$pathStorageLogo',
          onImageUrlLoaded: (String imageName, String downloadUrl) {

            element.imageUrl = downloadUrl;
          }
      );
    });

    return models;
  }

  @override
  Future<File> fetchPanorama(String placeId, String elementId) async {
    final elementRef =
        fst.ref().child(placeId).child(pathPanoramas).child('$elementId.jpg');

    final String imageIdentifier = '$placeId$elementId$imageExtension';
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final filePath = "${documentsDirectory.path}/$imageIdentifier";
    print(filePath);

    final file = File(filePath);

    TaskSnapshot taskSnapshot = await elementRef.writeToFile(file);
    if (taskSnapshot.state == TaskState.success) {
      return file;
    } else {
      throw FetchException();
    }
  }

  /*@override
  Future<PlaceDetailsModel> fetchPlaceDetails(String placeId) async {
    QuerySnapshot<Map<String, dynamic>> placesDetailsSnapshot = await ff
        .collection(pathPlacesDetails)
        .where(pathPlaceId, isEqualTo: placeId)
        .get();

    return placesDetailsSnapshot.docs
        .map((value) => PlaceDetailsModel.fromJson(value.data()))
        .toList()
        .first;
  }*/

  @override
  Future<List<PlacePlanLevelModel>> fetchPlacePlan(String placeId) async {
    QuerySnapshot<Map<String, dynamic>> placesPlansSnapshot = await ff
        .collection(pathPlacesPlans)
        .where(pathPlaceId, isEqualTo: placeId)
        .get();

    List<PlacePlanLevelModel> placeLevels = [];
    if (placesPlansSnapshot.docs.isNotEmpty) {
      String planDocumentId = placesPlansSnapshot.docs.first.id;

      QuerySnapshot<Map<String, dynamic>> placePlanLevelsSnapshot = await ff
          .collection(pathPlacesPlans)
          .doc(planDocumentId)
          .collection(pathPlacePlanLevels)
          .get(const GetOptions(source: Source.server));

      placeLevels = placePlanLevelsSnapshot.docs
          .map((value) => PlacePlanLevelModel.fromJson(value.data()))
          .toList();
    }

    return placeLevels;
  }

  @override
  Future<PlaceSettingsModel?> fetchPlaceSettings(String placeId) async {
    QuerySnapshot<Map<String, dynamic>> placeSettingsSnapshot = await ff
        .collection(pathPlacesSettings)
        .where(pathPlaceId, isEqualTo: placeId)
        .get(const GetOptions(source: Source.server));

    PlaceSettingsModel? placeSettings;
    if (placeSettingsSnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot<Map<String, dynamic>> firstDocument =
          placeSettingsSnapshot.docs.first;

      placeSettings =
          PlaceSettingsModel.fromJson(firstDocument.id, firstDocument.data());
    }

    return placeSettings;
  }

  @override
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId) async {
    QuerySnapshot<Map<String, dynamic>> placeMenuSnapshot = await ff
        .collection('$pathPlaces/$placeId/$pathPlaceMenu')
        .get(const GetOptions(source: Source.server));

    List<PlaceMenuModel> placeMenuModels = placeMenuSnapshot.docs
        .map((value) => PlaceMenuModel.fromJson(value.data()))
        .toList();

    PlaceMenuModel? placeMenuModel;
    if (placeMenuModels.isNotEmpty) {
      placeMenuModel = placeMenuModels.first;

      await _readImagesInFolder('$placeId/$pathStorageMenu',
          onImageUrlLoaded: (String imageName, String downloadUrl) {

        PlaceMenuItemModel? itemModel =
            placeMenuModel!.placeMenu[imageName.split('.')[0]];
        if (itemModel != null) {
          itemModel.url = downloadUrl;
        }
      });
    }

    return placeMenuModel;
  }

  _readImagesInFolder(String folderPath,
      {required void Function(String imageName, String downloadUrl)
          onImageUrlLoaded}) async {
    FirebaseStorage fs = FirebaseStorage.instance;
    ListResult imageFiles = await fs.ref(folderPath).listAll();

    await Future.forEach(imageFiles.items, (element) async {
      String imageName = element.name;
      String downloadUrl = await fs.ref(element.fullPath).getDownloadURL();
      onImageUrlLoaded(imageName, downloadUrl);
    });
  }

  @override
  Future<void> submitOrder(PlaceOrderModel placeOrderModel,
      String? reservationId, ChatMessageModel chatMessageModel) async {
    DocumentReference orderDocId = ff.collection(pathPlacesOrders).doc();

    DocumentReference chatDocId = ff
        .collection(pathPlacesReservations)
        .doc(reservationId)
        .collection(pathReservationChat)
        .doc();

    WriteBatch batch = ff.batch();
    batch.set(orderDocId, placeOrderModel.toJson());
    batch.set(chatDocId, chatMessageModel.toJson());

    await batch.commit();
  }

  @override
  Future<void> submitReservation(
      PlaceReservationModel placeReservationModel) async {
    DocumentReference doc = ff.collection(pathPlacesReservations).doc();

    String reservationId = doc.id.substring(0, 6);
    placeReservationModel.no = reservationId;

    await ff
        .collection(pathPlacesReservations)
        .doc(doc.id)
        .set(placeReservationModel.toJson());
  }

  @override
  Future<void> addChatMessage(
      String reservationId, ChatMessageModel chatMessageModel) async {
    CollectionReference<Map<String, dynamic>> chatCollection = ff
        .collection(pathPlacesReservations)
        .doc(reservationId)
        .collection(pathReservationChat);

    DocumentReference doc = chatCollection.doc();

    await chatCollection.doc(doc.id).set(chatMessageModel.toJson());
  }

  @override
  Stream<List<PlaceOrderModel>> fetchOrders(
      {String? placeId, String? userId, String? reservationId}) {
    Stream<QuerySnapshot<Map<String, dynamic>>> ordersSnapshotsStream =
        const Stream.empty();

    if (placeId != null) {
      //list of orders for place service
      ordersSnapshotsStream = ff
          .collection(pathPlacesOrders)
          .where(pathPlaceId, isEqualTo: placeId)
          .snapshots();
    } else if (reservationId != null) {
      //list of orders made by user connected with reservation
      ordersSnapshotsStream = ff
          .collection(pathPlacesOrders)
          //.where(pathUserId, isEqualTo: userId)
          .where(pathReservationId, isEqualTo: reservationId)
          .snapshots();
    } else if (userId != null){
      //list of all user orders
      ordersSnapshotsStream = ff
          .collection(pathPlacesOrders)
          .where(pathUserId, isEqualTo: userId)
          .snapshots();
    }

    return ordersSnapshotsStream.map((event) => event.docs
        .map((value) => PlaceOrderModel.fromJson(value.id, value.data()))
        .toList());
  }

  @override
  Stream<List<PlaceReservationModel>> fetchReservations(
      {String? placeId, DateTime? reservationDate, String? userId}) {
    Stream<QuerySnapshot<Map<String, dynamic>>> reservationsSnapshotStream =
        const Stream.empty();

    if (placeId != null && reservationDate != null) {
      //list of reservations for place service
      reservationsSnapshotStream = ff
          .collection(pathPlacesReservations)
          .where(pathPlaceId, isEqualTo: placeId)
          .where(pathStartDate, isGreaterThanOrEqualTo: reservationDate)
          .where(pathStartDate,
              isLessThan: reservationDate.add(const Duration(days: 1)))
          .snapshots();
    } else if (userId != null) {
      reservationsSnapshotStream = ff
          .collection(pathPlacesReservations)
          .where(pathUserId, isEqualTo: userId)
          .snapshots();
    }

    return reservationsSnapshotStream.map((event) => event.docs
        .map((value) => PlaceReservationModel.fromJson(value.id, value.data()))
        .toList());
  }

  @override
  Future<void> changeStatus(String reservationId, String closeStatus, String closedBy) async {

    await ff
        .collection(pathPlacesReservations)
        .doc(reservationId)
        .update({
      pathStatus: closeStatus,
      pathClosedBy: closedBy,
      pathUpdateDate: Timestamp.fromDate(DateTime.now())
    });
  }


  @override
  Stream<List<ChatMessageModel>> fetchChatMessages(
      String placeId, String reservationId) {
    Stream<QuerySnapshot<Map<String, dynamic>>> chatMessagesSnapshotsStream = ff
        .collection(pathPlacesReservations)
        .doc(reservationId)
        .collection(pathReservationChat)
        .snapshots();

    return chatMessagesSnapshotsStream.map((event) => event.docs
        .map((value) => ChatMessageModel.fromJson(value.data()))
        .toList());
  }
}
