// ignore_for_file: non_constant_identifier_names, duplicate_ignore

class PinjamRuanganBody {
  PinjamRuanganBody({
    required this.room_id,
    required this.date,
    required this.time_start,
    required this.time_end,
    required this.event,
    required this.description,
    required this.participant,
    required this.consumption,
    required this.note,
  });

  final int room_id;
  final String date;
  final String time_start;
  final String time_end;
  final String event;
  final String description;
  final int participant;
  final String consumption;
  final String note;

  Map<String, dynamic> toJson() => {
        'room_id': room_id,
        'date': date,
        'time_start': time_start,
        'time_end': time_end,
        'event': event,
        'description': description,
        'participant': participant,
        'consumption': consumption,
        'note': note,
      };
}
