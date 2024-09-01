class CarByIdData {
  CarByIdData({
    required this.id,
    required this.name,
    required this.description,
    required this.capacity,
    required this.picture,
    required this.license,
  });

  factory CarByIdData.fromModel(Map<String, dynamic> json) => CarByIdData(
        id: json['id'] as int,
        name: json['name'] as String,
        description:
            json['description'] != null ? json['description'] as String : null,
        capacity: json['capacity'] != null ? json['capacity'] as int : null,
        picture: json['picture'] as String,
        license: json['license'] as String,
      );

  final int id;
  final String name;
  final String? description;
  final int? capacity;
  final String picture;
  final String license;
}

class CarByIdResponse {
  CarByIdResponse({
    this.data,
    this.message,
    this.status,
  });

  factory CarByIdResponse.fromJson(Map<String, dynamic> json) =>
      CarByIdResponse(
        data: json['data'] != null
            ? CarByIdData.fromModel(json['data'] as Map<String, dynamic>)
            : null,
        message: json['message'] as String,
        status: json['status'] as int,
      );

  final CarByIdData? data;
  final String? message;
  final int? status;
}
