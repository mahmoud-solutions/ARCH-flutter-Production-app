class UserEntity {
  final String userName;
  final String userEmail;
  final String userRole;
  final String userToken;

  UserEntity({
    required this.userName,
    required this.userEmail,
    required this.userRole,
    required this.userToken,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    dynamic dataValue = json['data'];
    Map<String, dynamic> data;

    if (dataValue is List && dataValue.isNotEmpty) {
      data = dataValue[0] as Map<String, dynamic>;
    } else if (dataValue is Map<String, dynamic>) {
      data = dataValue;
    } else {
      data = {};
    }

    return UserEntity(
      userName: data['name']?.toString() ?? '',
      userEmail: data['email']?.toString() ?? '',
      userRole: data['role']?.toString() ?? '',
      userToken: data['token']?.toString() ?? '',
    );
  }
}
