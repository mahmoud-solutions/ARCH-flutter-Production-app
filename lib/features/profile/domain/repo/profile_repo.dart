import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/profile/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> getHomeInfo();

  Future<Either<Failure, ProfileEntity>> updateHomeInfo({
    required String email,
    required String name,
    XFile? profileImage,
  });
  Future<Either<Failure, Unit>> logout();
}
