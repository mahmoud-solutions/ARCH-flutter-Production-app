import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';

class Datum extends UserEntity {
  String? name;
  String? email;
  String? role;
  dynamic image;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? token;

  Datum({
    this.name,
    this.email,
    this.role,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.token,
  }) : super(
         userName: name ?? '',
         userEmail: email ?? '',
         userRole: role ?? '',
         userToken: token ?? '',
       );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json['name'] as String?,
    email: json['email'] as String?,
    role: json['role'] as String?,
    image: json['image'] as dynamic,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    id: json['id'] as int?,
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'role': role,
    'image': image,
    'updated_at': updatedAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'id': id,
    'token': token,
  };
}
