import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:arch_team_power/features/profile/domain/entities/profile_entity.dart';
import 'package:arch_team_power/features/profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ProfilerepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfilerepoImpl({required this.profileRemoteDataSource});
  @override
  Future<Either<Failure, ProfileEntity>> getHomeInfo() async {
    try {
      final profileData = await profileRemoteDataSource.getprofileInfo();
      return right(profileData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateHomeInfo({
    required String email,
    required String name,
    XFile? profileImage,
  }) async {
    try {
      final updateProfileData = await profileRemoteDataSource.updateProfileInfo(
        name: name,
        email: email,
        profileImage: profileImage,
      );
      return right(updateProfileData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await profileRemoteDataSource.logout();
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
