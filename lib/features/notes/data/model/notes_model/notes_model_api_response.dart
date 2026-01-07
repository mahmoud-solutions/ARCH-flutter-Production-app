class ApiResponse<T> {
  final bool success;
  final T data;
  final String message;

  const ApiResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'],
      data: fromJsonT(json['data']),
      message: json['message'],
    );
  }
}
