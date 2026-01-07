class ProfileEntity {
  final String profileId;
  final String userName;
  final String userEmail;
  final String? userProfileImage;

  const ProfileEntity({
    required this.profileId,
    required this.userName,
    required this.userEmail,
    this.userProfileImage,
  });
  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      profileId: json['id'] ?? '',
      userName: json['name'] ?? '',
      userEmail: json['email'] ?? '',
      userProfileImage: json['image'] as String?,
    );
  }
}
