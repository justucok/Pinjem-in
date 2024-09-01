import 'package:dio/dio.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/dio_client.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_car_list_response.dart';

class CarService {
  static Future<CarByIdResponse> getCarById(String id) async {
    try {
      final request = await dioClient
          .get<Map<String, dynamic>>('${Constants.baseUrl}car/$id');
      if (request.statusCode == 200) {
        final response = CarByIdResponse.fromJson(request.data!);
        return response;
      } else {
        final response = CarByIdResponse(message: 'Get Car By Id Failed');
        return response;
      }
    } on DioException catch (e) {
      final response = CarByIdResponse(message: '$e');
      return response;
    } catch (e) {
      final response = CarByIdResponse(message: '$e');
      return response;
    }
  }
}
