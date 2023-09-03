import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {
  @override
  List<Object> get props => [];
}

class NoParams extends Params {}

class PlaceIdParams extends Params {
  final String placeId;

  PlaceIdParams({required this.placeId});

  @override
  List<Object> get props => [placeId];
}

class UserIdParams extends Params {
  final String userId;

  UserIdParams({required this.userId});

  @override
  List<Object> get props => [userId];
}
