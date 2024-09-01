class NotificationDetailCarData {
  NotificationDetailCarData({
    required this.id,
    required this.carId,
    required this.destination,
    required this.description,
    required this.passanger,
    required this.passangerDesc,
    required this.driver,
    required this.datetimeStart,
    required this.status,
    required this.confirmationNote,
  });

  factory NotificationDetailCarData.fromModel(Map<String, dynamic> json) =>
      NotificationDetailCarData(
        id: json['id'] as int,
        carId: json['car_id'] as int,
        destination: json['destination'] as String,
        description: json['description'] as String,
        passanger: json['passanger'] as int,
        passangerDesc: json['passanger_description'] as String,
        driver: json['driver'] as String,
        datetimeStart: json['datetime_start'] as String,
        status: json['status'] as String,
        confirmationNote: json['confirmation_note'] != null
            ? json['confirmation_note'] as String
            : null,
      );

  final int id;
  final int carId;
  final String destination;
  final String description;
  final int passanger;
  final String passangerDesc;
  final String driver;
  final String datetimeStart;
  final String status;
  final String? confirmationNote;
}

class NotificationDetailCarResponse {
  NotificationDetailCarResponse({
    this.status,
    this.message,
    this.data,
  });

  factory NotificationDetailCarResponse.fromJson(Map<String, dynamic> json) =>
      NotificationDetailCarResponse(
        status: json['status'] as int,
        message: json['message'] as String,
        data: json['data'] != null
            ? NotificationDetailCarData.fromModel(
                json['data'] as Map<String, dynamic>,
              )
            : null,
      );

  final int? status;
  final String? message;
  final NotificationDetailCarData? data;
}
