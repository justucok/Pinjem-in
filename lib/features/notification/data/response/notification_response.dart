class NotificationData {
  NotificationData({
    required this.id,
    required this.transactionId,
    required this.notification,
    required this.type,
    required this.status,
    required this.timeago,
  });

  factory NotificationData.fromModel(Map<String, dynamic> json) =>
      NotificationData(
        id: json['id'] as int,
        transactionId: json['transaction_id'] as int,
        notification: json['notification'] as String,
        type: json['type'] as String,
        status: json['status'] as String,
        timeago: json['timeago'] as String,
      );

  final int id;
  final int transactionId;
  final String notification;
  final String type;
  final String status;
  final String timeago;
}

class NotificationResponse {
  NotificationResponse({
    this.data,
    this.status,
    this.message,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        data: json['data'] != null
            ? List.from(
                (json['data'] as List<dynamic>).map(
                  (e) => NotificationData.fromModel(e as Map<String, dynamic>),
                ),
              )
            : null,
        status: json['status'] as int,
        message: json['message'] as String,
      );

  final List<NotificationData>? data;
  final int? status;
  final String? message;
}
