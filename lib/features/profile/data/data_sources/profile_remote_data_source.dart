import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/profile/data/models/profile_model/profile_model.dart';
import 'package:arch_team_power/features/profile/domain/entities/profile_entity.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> getprofileInfo();
  Future<ProfileEntity> updateProfileInfo({
    required String name,
    required String email,
    XFile? profileImage,
  });
  Future<void> logout();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ProfileEntity> getprofileInfo() async {
    final data = await apiService.get(endPoint: 'profile');
    return ProfileModel.fromJson(data);
  }

  @override
  Future<ProfileEntity> updateProfileInfo({
    required String name,
    required String email,
    XFile? profileImage,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'email': email,
      if (profileImage != null)
        'profile_image': await MultipartFile.fromFile(
          profileImage.path,
          filename: profileImage.name,
        ),
    });

    final response = await apiService.post(
      endPoint: 'profile',
      data: formData,
      isMultipart: true,
    );

    return ProfileModel.fromJson(response);
  }

  @override
  Future<void> logout() async {
    await apiService.post(endPoint: 'logout');
  }
}
