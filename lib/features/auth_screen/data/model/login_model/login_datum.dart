import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';

class LogInDatum extends UserEntity {
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  dynamic image;
  dynamic provider;

  String? token;

  LogInDatum({
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.image,
    this.provider,

    this.token,
  }) : super(
         userEmail: email ?? '',
         userName: name ?? '',
         userRole: role ?? '',
         userToken: token ?? '',
       );

  factory LogInDatum.fromJson(Map<String, dynamic> json) {
    return LogInDatum(
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      emailVerifiedAt: json['email_verified_at'],
      role: json['role']?.toString(),
      image: json['image'],
      provider: json['provider'],
      token: json['token']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'email_verified_at': emailVerifiedAt,
    'role': role,
    'image': image,
    'provider': provider,

    'token': token,
  };
}
