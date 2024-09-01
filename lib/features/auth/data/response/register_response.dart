class RegisterResponse {
  RegisterResponse({
    required this.message,
    this.status,
    this.errMessage,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json['status'] as int,
        message: json['message'] as String,
      );

  final int? status;
  final String message;
  final dynamic errMessage;
}
