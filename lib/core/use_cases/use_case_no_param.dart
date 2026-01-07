import 'package:arch_team_power/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseNoParam<Type> {
  Future<Either<Failure, Type>> call();
}
