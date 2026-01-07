part of 'get_profile_data_cubit.dart';

@immutable
sealed class ProfileDataState {}

final class GetProfileDataInitial extends ProfileDataState {}

final class GetProfileDataLoading extends ProfileDataState {}

final class GetProfileDataSuccess extends ProfileDataState {
  final ProfileEntity profileData;

  GetProfileDataSuccess({required this.profileData});
}

final class GetProfileDataFailure extends ProfileDataState {
  final String errorMessage;

  GetProfileDataFailure({required this.errorMessage});
}

final class ProfileImagePicked extends ProfileDataState {}

final class UpdateProfileDataInitial extends ProfileDataState {}

final class UpdateProfileDataLoading extends ProfileDataState {}

final class UpdateProfileDataSuccess extends ProfileDataState {
  final ProfileEntity profileEntity;
  UpdateProfileDataSuccess(this.profileEntity);
}

final class UpdateProfileDataFailure extends ProfileDataState {
  final String errorMessage;
  UpdateProfileDataFailure(this.errorMessage);
}
