// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginData {
  LoginData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.division,
    required this.role,
    required this.token,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String division;
  final String role;
  final String token;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        division: json['division'] as String,
        role: json['role'] as String,
        token: json['token'] as String,
      );
}

class LoginResponse {
  LoginResponse({
    required this.message,
    this.data,
  });

  final LoginData? data;
  final String message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: json['data'] != null
            ? LoginData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message: json['message'] as String,
      );
}
