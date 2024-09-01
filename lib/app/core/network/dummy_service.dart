import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/dio_client.dart';
import 'package:pinjem_in_app/features/home/data/response/dummy_mobil_response.dart';

class DummyService {
  static Future<DummyMobilResponse> getDataMobil() async {
    final response =
        await dioClient.get<List<dynamic>>('${Constants.dummmyUrl}/mobil');
    final result = DummyMobilResponse.fromJson(response.data);
    return result;
  }
}
