class PostPinjamMobilResponse {
  PostPinjamMobilResponse({
    required this.message,
    this.status,
  });

  factory PostPinjamMobilResponse.fromJson(Map<String, dynamic> json) =>
      PostPinjamMobilResponse(
        status: json['status'] as int,
        message: json['message'] as String,
      );

  final int? status;
  final String message;
}
