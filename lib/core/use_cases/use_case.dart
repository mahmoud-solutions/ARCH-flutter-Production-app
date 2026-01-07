import 'package:arch_team_power/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Param> {
  Future<Either<Failure, Type>> call({required Param pram});
}

abstract class CategoryUseCase<Type, Param, PageNumber> {
  Future<Either<Failure, Type>> call({
    required Param pram,
    PageNumber pageNumber,
  });
}
