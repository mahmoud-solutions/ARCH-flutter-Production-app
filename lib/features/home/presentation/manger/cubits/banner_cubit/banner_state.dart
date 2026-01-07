part of 'banner_cubit.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerCubitLoading extends BannerState {}

final class BannerCubitError extends BannerState {
  final String message;
  BannerCubitError(this.message);
}

final class BannerCubitLoaded extends BannerState {
  final List<Bannner> banners;
  BannerCubitLoaded(this.banners);
}
