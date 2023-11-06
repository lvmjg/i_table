import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:i_table/features/place_menu/data/model/place_menu_item_model.dart';
import 'package:i_table/features/user_orders/data/model/place_order_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';
import '../model/place_menu_model.dart';

abstract class PlaceMenuRemoteDataSource {
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId);
  Future<void> submitOrder(PlaceOrderModel placeOrderModel);
}

class PlaceMenuRemoteDataSourceImpl implements PlaceMenuRemoteDataSource {
  @override
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));




    FirebaseFirestore ff = FirebaseFirestore.instance;

    PlaceMenuModel? placeMenuModel;
    try {
      QuerySnapshot<Map<String, dynamic>> placeMenuSnapshot =
          await ff.collection('$pathPlaces/$placeId/$pathPlaceMenu').get(const GetOptions(source: Source.server));

      List<PlaceMenuModel> placeMenuModels = placeMenuSnapshot.docs
          .map((value) => PlaceMenuModel.fromJson(value.data()))
          .toList();

      if (placeMenuModels.isNotEmpty) {
        placeMenuModel = placeMenuModels.first;

        FirebaseStorage fs = FirebaseStorage.instance;
        ListResult imageFiles = await fs.ref('$placeId/$pathStorageMenu').listAll();

        await Future.forEach(imageFiles.items, (element) async {
          String test = element.name;
          PlaceMenuItemModel? itemModel = placeMenuModel!.placeMenu[element.name.split('.')[0]];
          if(itemModel!=null){
            String idDownloadUrl = await fs.ref(element.fullPath).getDownloadURL();
            itemModel.url = idDownloadUrl;
          }
        });
      }
    } catch (e, s) {
      throw FetchException();
    }

    return placeMenuModel;
  }

  @override
  Future<void> submitOrder(PlaceOrderModel placeOrderModel) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;
    try {
      DocumentReference doc = ff.collection(pathPlacesOrders).doc();

      await ff.collection(pathPlacesOrders).doc(doc.id).set(placeOrderModel.toJson());
    } catch (e, s) {
      throw FetchException();
    }
  }
}
