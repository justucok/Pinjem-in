class PinjamRuanganData {
  PinjamRuanganData({
    required this.id,
    required this.roomName,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.status,
    required this.event,
  });

  factory PinjamRuanganData.fromModel(Map<String, dynamic> json) =>
      PinjamRuanganData(
        id: json['id'] as int,
        roomName: json['room_name'] as String,
        event: json['event'] as String,
        date: json['date'] as String,
        timeStart: json['time_start'] as String,
        timeEnd: json['time_end'] as String,
        status: json['status'] as String,
      );

  final int id;
  final String roomName;
  final String event;
  final String date;
  final String timeStart;
  final String timeEnd;
  final String status;
}

class PinjamRuanganResponse {
  PinjamRuanganResponse({
    required this.status,
    this.data,
  });

  factory PinjamRuanganResponse.fromJson(Map<String, dynamic>? json) =>
      PinjamRuanganResponse(
        data: json!['data'] != null
            ? List.from(
                (json['data'] as List<dynamic>).map(
                  (e) => PinjamRuanganData.fromModel(e as Map<String, dynamic>),
                ),
              )
            : null,
        status: json['status'] as int,
      );

  final List<PinjamRuanganData>? data;
  final int status;
}
