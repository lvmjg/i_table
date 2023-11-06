import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/error/failures.dart';

import '../../domain/entity/place_plan/plan_elements_factory.dart';
import '../../domain/entity/place_plan/plan_elements_group.dart';
import '../../domain/entity/place_plan/plan_level.dart';
import '../data_source/place_plan_remote_data_source.dart';
import '../model/place_plan/place_plan_level_model.dart';

abstract class PlacePlanRepository {
  Future<Either<Failure, List<PlanLevel>>> fetchPlacePlan(String placeId);
}

class PlacePlanRepositoryImpl implements PlacePlanRepository {
  final PlacePlanRemoteDataSource placePlanRemoteDataSource;
  final PlanElementsFactory planFactory;

  PlacePlanRepositoryImpl(this.placePlanRemoteDataSource, this.planFactory);

  @override
  Future<Either<Failure, List<PlanLevel>>> fetchPlacePlan(
      String placeId) async {
    try {
      List<PlacePlanLevelModel> placePlanLevelModels =
          await placePlanRemoteDataSource.fetchPlacePlan(placeId);

      Map<String, PlanElementsGroup> otherElements =
          planFactory.getStaticElements(placePlanLevelModels);
      Map<String, PlanElementsGroup> aloneSittings =
          planFactory.getAloneSittings(placePlanLevelModels);
      Map<String, PlanElementsGroup> aloneSittingGroups =
          planFactory.getAloneSittingGroups(placePlanLevelModels);
      Map<String, PlanElementsGroup> tables =
          planFactory.getTables(placePlanLevelModels);

      Map<String, PlanElementsGroup> planElements = {};
      planElements.addAll(aloneSittings);
      planElements.addAll(aloneSittingGroups);
      planElements.addAll(tables);

      List<PlanLevel> placePlanLevels = [];
      placePlanLevels.add(PlanLevel(
          placePlanLevelModels.first.placePlanLevelId,
          placePlanLevelModels.first.placePlanLevelName,
          placePlanLevelModels.first.placePlanLevelOrder,
          planElements,
          otherElements));

      return Right(placePlanLevels);
    } on FetchException {
      return Left(FetchFailure());
    }
  }








}
