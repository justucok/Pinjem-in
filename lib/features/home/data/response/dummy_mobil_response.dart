class DummyMobilData {
  DummyMobilData({
    required this.id,
    required this.tujuan,
    required this.tanggal,
    required this.jam,
  });

  factory DummyMobilData.fromModel(Map<String, dynamic> json) => DummyMobilData(
        id: json['id'] as String,
        tujuan: json['tujuan'] as String,
        tanggal: json['tanggal'] as String,
        jam: json['jam'] as String,
      );

  final String id;
  final String tujuan;
  final String tanggal;
  final String jam;
}

class DummyMobilResponse {
  DummyMobilResponse({required this.data, this.message});

  factory DummyMobilResponse.fromJson(List<dynamic>? json) =>
      DummyMobilResponse(
        data: json!
            .map((e) => DummyMobilData.fromModel(e as Map<String, dynamic>))
            .toList(),
      );

  final List<DummyMobilData>? data;
  final String? message;
}
