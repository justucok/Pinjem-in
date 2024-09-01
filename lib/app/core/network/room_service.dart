import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/dio_client.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_room_list_response.dart';

class RoomService {
  static Future<RoomByIdResponse> getRoomById(String id) async {
    try {
      final request = await dioClient
          .get<Map<String, dynamic>>('${Constants.baseUrl}room/$id');
      if (request.statusCode == 200) {
        final response = RoomByIdResponse.fromJson(request.data!);
        return response;
      } else {
        final response = RoomByIdResponse(message: 'Failed Get Room By Id');
        return response;
      }
    } on DioException catch (e) {
      log('Room By Id Service Dio Ex Catch: $e');
      final response = RoomByIdResponse(message: e.toString());
      return response;
    } catch (e) {
      log('Room By Id Service Catch: $e');
      final response = RoomByIdResponse(message: e.toString());
      return response;
    }
  }
}
