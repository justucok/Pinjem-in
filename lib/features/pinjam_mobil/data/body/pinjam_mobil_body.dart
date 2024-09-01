class PinjamMobilBody {
  PinjamMobilBody({
    required this.destination,
    required this.description,
    required this.date,
    required this.time,
    required this.passanger,
    required this.driver,
    required this.passangerDescription,
  });

  Map<String, dynamic> toJson() => {
        'destination': destination,
        'description': description,
        'date': date,
        'time': time,
        'passanger': passanger,
        'driver': driver,
        'passanger_description': passangerDescription,
      };

  final String destination;
  final String description;
  final String date;
  final String time;
  final int passanger;
  final String driver;
  final String passangerDescription;
}
