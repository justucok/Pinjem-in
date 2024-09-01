class PostPinjamRuanganResponse {
  PostPinjamRuanganResponse({
    required this.message,
    this.status,
  });

  factory PostPinjamRuanganResponse.fromJson(Map<String, dynamic> json) =>
      PostPinjamRuanganResponse(
        status: json['status'] as int,
        message: json['message'] as String,
      );

  final int? status;
  final String message;
}
