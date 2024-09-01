class NotificationDetailRoomData {
  NotificationDetailRoomData({
    required this.id,
    required this.roomId,
    required this.event,
    required this.description,
    required this.participant,
    required this.note,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.consumption,
    required this.status,
    required this.confirmationNote,
  });

  factory NotificationDetailRoomData.fromModel(Map<String, dynamic> json) =>
      NotificationDetailRoomData(
        id: json['id'] as int,
        roomId: json['room_id'] as int,
        event: json['event'] as String,
        description: json['description'] as String,
        participant: json['participant'] as int,
        note: json['note'] as String,
        date: json['date'] as String,
        timeStart: json['time_start'] as String,
        timeEnd: json['time_end'] as String,
        consumption: json['consumption'] as String,
        status: json['status'] as String,
        confirmationNote: json['confirmation_note'] as String,
      );

  final int id;
  final int roomId;
  final String event;
  final String description;
  final int participant;
  final String note;
  final String date;
  final String timeStart;
  final String timeEnd;
  final String consumption;
  final String status;
  final String confirmationNote;
}

class NotificationDetailRoomResponse {
  NotificationDetailRoomResponse({
    this.status,
    this.message,
    this.data,
  });

  factory NotificationDetailRoomResponse.fromJson(Map<String, dynamic> json) =>
      NotificationDetailRoomResponse(
        status: json['status'] as int,
        message: json['message'] as String,
        data: json['data'] != null
            ? NotificationDetailRoomData.fromModel(
                json['data'] as Map<String, dynamic>,
              )
            : null,
      );

  final int? status;
  final String? message;
  final NotificationDetailRoomData? data;
}
