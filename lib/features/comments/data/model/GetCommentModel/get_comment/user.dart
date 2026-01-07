class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  dynamic image;
  dynamic provider;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deviceToken;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.image,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.deviceToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    emailVerifiedAt: json['email_verified_at'] as dynamic,
    role: json['role'] as String?,
    image: json['image'] as dynamic,
    provider: json['provider'] as dynamic,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deviceToken: json['device_token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'email_verified_at': emailVerifiedAt,
    'role': role,
    'image': image,
    'provider': provider,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'device_token': deviceToken,
  };
}
