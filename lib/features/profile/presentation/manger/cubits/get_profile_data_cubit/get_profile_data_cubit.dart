import 'package:arch_team_power/features/profile/domain/entities/profile_entity.dart';
import 'package:arch_team_power/features/profile/domain/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'get_profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit(this.profilerepo) : super(GetProfileDataInitial());
  final ProfileRepo profilerepo;
  XFile? pickedImage;
  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedImage = image;
      emit(ProfileImagePicked());
    }
  }

  Future<void> getProfileData() async {
    emit(GetProfileDataLoading());
    final data = await profilerepo.getHomeInfo();
    data.fold(
      (failure) {
        emit(GetProfileDataFailure(errorMessage: failure.message));
      },
      (data) {
        emit(GetProfileDataSuccess(profileData: data));
      },
    );
  }

  Future<void> updateProfileData({
    required String name,
    required String email,
  }) async {
    emit(UpdateProfileDataLoading());

    final result = await profilerepo.updateHomeInfo(
      name: name,
      email: email,
      profileImage: pickedImage,
    );

    result.fold(
      (failure) => emit(UpdateProfileDataFailure(failure.message)),
      (profile) => emit(UpdateProfileDataSuccess(profile)),
    );
  }
}
