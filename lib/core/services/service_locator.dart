import 'dart:io';
import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/Notifications/data/Notification_Repo_impl/notification_repo_impl.dart';
import 'package:arch_team_power/features/Notifications/data/Notify_reomete_data_source/notify_remote_data_source.dart';
import 'package:arch_team_power/features/Notifications/domain/Notidication_Usecase/delete_all_notification%20usecase.dart';
import 'package:arch_team_power/features/Notifications/domain/Notidication_Usecase/get_Notidication_usecase.dart';
import 'package:arch_team_power/features/Notifications/domain/repo/notificarion%20_repo.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/delete_Notification_cubit/delete_notification_cubit.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/notifications_cubit/notifications_cubit.dart';
import 'package:arch_team_power/features/Payment_Methods/data/data_sources/payment_gateway_remote_data_source.dart';
import 'package:arch_team_power/features/Payment_Methods/data/repos_impl/payment_gateway_repo_impl.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/repo/payment_gateway_repo.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/get_subscription_plans_use_case.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/get_subscription_status_use_case.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/cancel_subscription_use_case.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/apple_subscription_use_case.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/use_cases/google_play_activate_subscription_use_case.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/payment_cubit/get_subscription_plans_cubit.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/google_play_subscription_cubit/google_play_subscription_cubit.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/get_subscription_status_cubit/get_subscription_status_cubit.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/cancel_subscription_cubit/cancel_subscription_cubit.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/appl_subscription_cubit/apple_subscription_cubit.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_local_data_source.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_remote_data_source.dart';
import 'package:arch_team_power/features/auth_screen/data/repos_impl/auth_repo_impl.dart';
import 'package:arch_team_power/features/auth_screen/domain/repo/auth_repo.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/check_reset_code_use_case.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/login_use_case.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/resend_verify_code_use_case.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/send_verify_code_use_case.dart';
import 'package:arch_team_power/features/auth_screen/domain/use_cases/signup_use_case.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:arch_team_power/features/comments/data/remote_data_source/commernts_remote_data_source.dart';
import 'package:arch_team_power/features/comments/data/repo_impl/commernt_repo_impl.dart';
import 'package:arch_team_power/features/comments/domain/CommentUseCase/like_comment_usecase.dart';
import 'package:arch_team_power/features/comments/domain/repo/commernt_repo.dart';
import 'package:arch_team_power/features/comments/presentation/manger/GetCommentCubit/cubit/get_comment_cubit.dart';
import 'package:arch_team_power/features/comments/presentation/manger/addCommenCubit/cubit/add_comment_cubit.dart';
import 'package:arch_team_power/features/comments/presentation/manger/likeCubit/like_comment_cubit.dart';
import 'package:arch_team_power/features/favorite_screen/data/data%20source/favourite_remote_data_source.dart';
import 'package:arch_team_power/features/favorite_screen/data/repo_impl/favourite_repo_impl.dart';
import 'package:arch_team_power/features/favorite_screen/domain/repo/favourite_repo.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/get_favourite_cubite/cubit/get_favourite_cubit.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/post_favourite_cubit_cubit.dart';
import 'package:arch_team_power/features/home/data/data_sources/home_local_data_source.dart';
import 'package:arch_team_power/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:arch_team_power/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_inscriptions_details_use_case.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_inscriptions_library_use_case.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_sub_places_details_use_case.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_sub_places_use_case.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/Inscriptions_details_cubit/inscriptions_details_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/banner_cubit/banner_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/inscriptions_library_cubit/inscriptions_library_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/slider_cubit/slider_cubit_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/pubularPlaces/pobular_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_cubit/sub_places_cubit.dart';
import 'package:arch_team_power/features/home/presentation/manger/cubits/sub_places_details_cubit/sub_places_details_cubit.dart';
import 'package:arch_team_power/features/notes/data/data_source/notes_remote_data_source.dart';
import 'package:arch_team_power/features/notes/data/repo_impl/notes_repo_impl.dart';
import 'package:arch_team_power/features/notes/domain/repo/notes_repo.dart';
import 'package:arch_team_power/features/notes/domain/use_cases/create_note_use_case.dart';
import 'package:arch_team_power/features/notes/domain/use_cases/del_note_use_case.dart';
import 'package:arch_team_power/features/notes/domain/use_cases/edit_note_use_case.dart';
import 'package:arch_team_power/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/create_note_cubit/create_note_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/delete_note_cubit/delete_note_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/edit_notes_cubit/edit_notes_cubit.dart';
import 'package:arch_team_power/features/notes/presentation/screens/manger/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:arch_team_power/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:arch_team_power/features/profile/data/repos_impl/profile_repo_impl.dart';
import 'package:arch_team_power/features/profile/domain/repo/profile_repo.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/get_profile_data_cubit/get_profile_data_cubit.dart';
import 'package:arch_team_power/features/profile/presentation/manger/cubits/log_out_cubit/log_out_cubit.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/login_cubit/login_cubit.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:arch_team_power/features/details_screen/data/data_sources/popular_places_details_remote_data_source.dart';
import 'package:arch_team_power/features/details_screen/data/repos_impl/popular_places_details_repo_impl.dart';
import 'package:arch_team_power/features/details_screen/domain/repo/popular_places_details_repo.dart';
import 'package:arch_team_power/features/details_screen/data/data_sources/popular_places_details_local_data_source.dart';
import 'package:dio/io.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Local DataSources //
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  // Dio //
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors.add(AuthInterceptor(sl<AuthLocalDataSource>()));
    return dio;
  });

  // ApiService //
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));

  // Remote DataSources //
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<CommentRemoteDataSource>(
    () => CommentRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<NotesRemoteDataSource>(
    () => NotesRemoteDataSourceImpl(sl<ApiService>()),
  );
  // تسجيل الـ FavouriteRemoteDataSource
  sl.registerLazySingleton<FavouriteRemoteDataSource>(
    () => FavouriteRemoteDataSourceImpl(sl<ApiService>()),
  );

  // تسجيل الـ PaymentGatewayRemoteDataSource
  sl.registerLazySingleton<PaymentGatewayRemoteDataSource>(
    () => PaymentGatewayRemoteDataSourceImpl(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(sl<ApiService>()),
  );
  // Repositories //
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>(),
    ),
  );

  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImplemtion(
      sl<HomeRemoteDataSource>(),
      sl<HomeLocalDataSource>(),
    ),
  );
  sl.registerLazySingleton<NotesRepo>(
    () => NotesRepoImpl(remoteDataSource: sl<NotesRemoteDataSource>()),
  );
  sl.registerLazySingleton<FavouriteRepoAbstract>(
    () => FavouriteRepositoryImpl(sl<FavouriteRemoteDataSource>()),
  );
  sl.registerLazySingleton<CommentRepo>(
    () => CommerntRepoImpl(sl<CommentRemoteDataSource>()),
  );

  sl.registerLazySingleton<ProfileRepo>(
    () =>
        ProfilerepoImpl(profileRemoteDataSource: sl<ProfileRemoteDataSource>()),
  );
  sl.registerLazySingleton<PaymentGatewayRepo>(
    () => PaymentGatewayRepoImpl(
      paymentGatewayRemoteDataSource: sl<PaymentGatewayRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<PopularPlacesDetailsRemoteDataSource>(
    () => PopularPlacesDetailsRemoteDataSourceImpl(sl<ApiService>()),
  );

  sl.registerLazySingleton<PopularPlacesDetailsRepo>(
    () => PopularPlacesDetailsRepoImpl(
      sl<PopularPlacesDetailsRemoteDataSource>(),
      PopularPlacesDetailsLocalDataSourceImpl(),
    ),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl<NotificationRemoteDataSource>()),
  );
  // Use Cases //
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepo>()));
  sl.registerLazySingleton(() => SignupUseCase(sl<AuthRepo>()));

  sl.registerLazySingleton(() => GetNotesUseCase(notesRepo: sl<NotesRepo>()));
  sl.registerLazySingleton(() => EditNoteUseCase(notesRepo: sl<NotesRepo>()));
  sl.registerLazySingleton(() => DelNoteUseCase(notesRepo: sl<NotesRepo>()));
  sl.registerLazySingleton(() => CreateNoteUseCase(notesRepo: sl<NotesRepo>()));
  sl.registerLazySingleton(
    () => GetAllNotificationsUseCase(sl<NotificationRepository>()),
  );
  sl.registerLazySingleton(
    () => DeleteAllNotificationsUseCase(sl<NotificationRepository>()),
  );
  sl.registerLazySingleton(
    () => GetSubscriptionPlansUseCase(
      paymentGatewayRepo: sl<PaymentGatewayRepo>(),
    ),
  );
  sl.registerLazySingleton(
    () => GetSubscriptionStatusUseCase(
      paymentGatewayRepo: sl<PaymentGatewayRepo>(),
    ),
  );
  sl.registerLazySingleton(
    () =>
        CancelSubscriptionUseCase(paymentGatewayRepo: sl<PaymentGatewayRepo>()),
  );
  sl.registerLazySingleton(
    () => AppleSubscriptionUseCase(sl<PaymentGatewayRepo>()),
  );
  sl.registerLazySingleton(
    () => GooglePlayActivateSubscriptionUseCase(
      paymentGatewayRepo: sl<PaymentGatewayRepo>(),
    ),
  );

  sl.registerLazySingleton(
    () => GetSubPlacesDetailsUseCase(homeRepo: sl<HomeRepo>()),
  );
  sl.registerLazySingleton(() => GetSubPlacesUseCase(homeRepo: sl<HomeRepo>()));
  sl.registerLazySingleton(
    () => GetInscriptionsDetailsUseCase(homeRepo: sl<HomeRepo>()),
  );
  sl.registerLazySingleton(
    () => GetInscriptionsUseCase(homeRepo: sl<HomeRepo>()),
  );

  sl.registerFactory(() => GetFavouriteCubit(sl<FavouriteRepoAbstract>()));
  sl.registerLazySingleton(
    () => CheckResetCodeUseCase(authRepo: sl<AuthRepo>()),
  );
  sl.registerLazySingleton(
    () => ResendVerifyCodeUseCase(authRepo: sl<AuthRepo>()),
  );
  sl.registerLazySingleton(
    () => SendVerifyCodeUseCase(authRepo: sl<AuthRepo>()),
  );
  sl.registerLazySingleton(() => LikeCommentUseCase(sl<CommentRepo>()));

  // Cubits //
  sl.registerFactory(() => ProfileDataCubit(sl<ProfileRepo>()));
  sl.registerFactory(
    () => LogOutCubit(
      authLocalDataSource: sl<AuthLocalDataSource>(),
      profilerepo: sl<ProfileRepo>(),
    ),
  );
  sl.registerFactory(() => SliderCubitCubit(sl<HomeRepo>()));
  sl.registerFactory(() => GetNotesCubit(sl<GetNotesUseCase>()));
  sl.registerFactory(() => EditNotesCubit(sl<EditNoteUseCase>()));
  sl.registerFactory(() => DeleteNoteCubit(sl<DelNoteUseCase>()));
  sl.registerFactory(() => CreateNoteCubit(sl<CreateNoteUseCase>()));
  sl.registerFactory(() => BannerCubit(sl<HomeRepo>()));
  sl.registerFactory(() => PostFavouriteCubit(sl<FavouriteRepoAbstract>()));
  sl.registerFactory(() => PobularCubit(sl<HomeRepo>()));
  sl.registerFactory(() => SubPlacesCubit(sl<GetSubPlacesUseCase>()));
  sl.registerFactory(
    () => SubPlacesDetailsCubit(sl<GetSubPlacesDetailsUseCase>()),
  );

  sl.registerFactory(
    () => InscriptionsDetailsCubit(sl<GetInscriptionsDetailsUseCase>()),
  );
  sl.registerFactory(
    () => ForgotPasswordCubit(
      checkResetCodeUseCase: sl<CheckResetCodeUseCase>(),
      resendVerifyCodeUseCase: sl<ResendVerifyCodeUseCase>(),
      sendVerifyCodeUseCase: sl<SendVerifyCodeUseCase>(),
    ),
  );

  sl.registerFactory(() => GetCommentCubit(sl<CommentRepo>()));
  sl.registerFactory(
    () => InscriptionsLibraryCubit(sl<GetInscriptionsUseCase>()),
  );
  sl.registerFactory(() => AddCommentCubit(sl<CommentRepo>()));
  sl.registerFactory(
    () => GetSubscriptionPlansCubit(sl<GetSubscriptionPlansUseCase>()),
  );

  // Additional Payment Methods Cubits //
  sl.registerFactory(
    () => GooglePlaySubscriptionCubit(
      sl<GooglePlayActivateSubscriptionUseCase>(),
    ),
  );
  sl.registerFactory(
    () => GetSubscriptionStatusCubit(sl<GetSubscriptionStatusUseCase>()),
  );
  sl.registerFactory(
    () => CancelSubscriptionCubit(sl<CancelSubscriptionUseCase>()),
  );
  sl.registerFactory(
    () => AppleSubscriptionCubit(sl<AppleSubscriptionUseCase>()),
  );
  sl.registerFactory(() => LikeCommentCubit(sl<LikeCommentUseCase>()));

  // Auth Cubits //
  sl.registerFactory(() => LoginCubit(sl<LoginUseCase>()));
  sl.registerFactory(() => SignUpCubit(sl<SignupUseCase>()));

  sl.registerFactory(
    () => NotificationsCubit(sl<GetAllNotificationsUseCase>()),
  );

  sl.registerFactory(
    () => DeleteAllNotificationsCubit(sl<DeleteAllNotificationsUseCase>()),
  );
}
