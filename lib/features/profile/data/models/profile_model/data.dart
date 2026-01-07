import 'subscription_details.dart';

class Data {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  dynamic image;
  dynamic provider;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic profileImage;
  bool? subscription;
  SubscriptionDetails? subscriptionDetails;

  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.image,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.subscription,
    this.subscriptionDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    profileImage: json['profile_image'] as dynamic,
    subscription: json['subscription'] as bool?,
    subscriptionDetails: json['subscription_details'] == null
        ? null
        : SubscriptionDetails.fromJson(
            json['subscription_details'] as Map<String, dynamic>,
          ),
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
    'profile_image': profileImage,
    'subscription': subscription,
    'subscription_details': subscriptionDetails?.toJson(),
  };
}
