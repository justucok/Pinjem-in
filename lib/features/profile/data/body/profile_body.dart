class User {

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.division,
    required this.picture,
  });

  final String name;
  final String email;
  final String password;
  final String phone;
  final String division;
  final String? picture;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'division': division,
    'picture': picture,
    };

}
