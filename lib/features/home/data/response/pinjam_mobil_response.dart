class PinjamMobilData {
  PinjamMobilData({
    required this.id,
    required this.destination,
    required this.date,
    required this.time,
    required this.status,
  });

  factory PinjamMobilData.fromModel(Map<String, dynamic> json) =>
      PinjamMobilData(
        id: json['id'] as int,
        destination: json['destination'] as String,
        date: json['datetime_start'] as String,
        time: json['datetime_start'] as String,
        status: json['status'] as String,
      );

  final int id;
  final String destination;
  final String date;
  final String time;
  final String status;
}

class PinjamMobilResponse {
  PinjamMobilResponse({this.data, this.status});

  factory PinjamMobilResponse.fromJson(Map<String, dynamic>? json) =>
      PinjamMobilResponse(
        data: json!['data'] != null
            ? List.from(
                (json['data'] as List<dynamic>).map(
                  (e) => PinjamMobilData.fromModel(e as Map<String, dynamic>),
                ),
              )
            : null,
        status: json['status'] as int,
      );

  final List<PinjamMobilData>? data;
  final int? status;
}
