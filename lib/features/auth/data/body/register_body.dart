class RegisterBody {
  RegisterBody({
    required this.email,
    required this.name,
    required this.nomor,
    required this.divisi,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': nomor,
        'division': divisi,
        'password': password,
      };

  final String email;
  final String name;
  final int nomor;
  final String divisi;
  final String password;
}
