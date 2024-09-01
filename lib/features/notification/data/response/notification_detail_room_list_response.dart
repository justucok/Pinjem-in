class RoomByIdData {
  RoomByIdData({
    required this.id,
    required this.name,
    required this.description,
    required this.capacity,
    required this.picture,
  });

  factory RoomByIdData.fromModel(Map<String, dynamic> json) => RoomByIdData(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        capacity: json['capacity'] as int,
        picture: json['picture'] as String,
      );

  final int id;
  final String name;
  final String description;
  final int capacity;
  final String picture;
}

class RoomByIdResponse {
  RoomByIdResponse({
    this.data,
    this.message,
    this.status,
  });

  factory RoomByIdResponse.fromJson(Map<String, dynamic> json) =>
      RoomByIdResponse(
        data: json['data'] != null
            ? RoomByIdData.fromModel(json['data'] as Map<String, dynamic>)
            : null,
        message: json['message'] as String,
        status: json['status'] as int,
      );

  final RoomByIdData? data;
  final String? message;
  final int? status;
}
