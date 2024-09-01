class UserApiData {
  UserApiData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.division,
    required this.picture,
  });

  factory UserApiData.fromModel(Map<String, dynamic> json) {
    return UserApiData(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      division: json['division'] as String,
      picture: json['picture'] != null ? json['picture'] as String : null,
    );
  }
  final int id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String division;
  final String? picture;
}

class UserApiResponse {
  UserApiResponse({
    required this.status,
    this.data,
  });

  factory UserApiResponse.fromJson(Map<String, dynamic>? json) =>
      UserApiResponse(
        data: json!['data'] != null
            ? UserApiData.fromModel(json['data'] as Map<String, dynamic>)
            : null,
        status: json['status'] as int,
      );

  final UserApiData? data;
  final int status;
}
