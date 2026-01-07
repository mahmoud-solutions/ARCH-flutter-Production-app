import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/home/data/data_sources/home_local_data_source.dart';
import 'package:arch_team_power/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arch_team_power/features/home/data/model/banner/banner.dart';
import 'package:arch_team_power/features/home/data/model/home/slider.data.dart';
import 'package:arch_team_power/features/home/data/model/popular/popular_place.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/popular_places_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplemtion extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplemtion(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<Failure, List<PopularSectionEntity>>> fetchPopularPlaces() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Sliderr>>> fetchSliders() async {
    try {
      final sliders = await homeRemoteDataSource.fetchSliders();
      return Right(sliders);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PopularPlace>>> fetchAllPopularPlaces() async {
    try {
      final popular = await homeRemoteDataSource.fetchPopularPlaces();
      return Right(popular);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Bannner>>> fetchBanners() async {
    try {
      final banners = await homeRemoteDataSource.fetchBanner();
      return Right(banners);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InscriptionsEntity>>> getInscriptions() async {
    try {
      final ruins = await homeRemoteDataSource.getInscriptions();
      return Right(ruins);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InscriptionsEntity>> getInscriptionsDetails({
    required int id,
  }) async {
    try {
      final ruin = await homeRemoteDataSource.getInscriptionsDetails(id: id);
      return Right(ruin);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubPlaceEntity>>> getSubPlaces() async {
    try {
      final places = await homeRemoteDataSource.getSubPlaces();
      return Right(places);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SubPlaceEntity>> getSubPlacesDetails({
    required int id,
  }) async {
    try {
      final place = await homeRemoteDataSource.getSubPlacesDetails(id: id);
      return Right(place);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
