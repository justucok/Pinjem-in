import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/dio_client.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_car_response.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_detail_room_response.dart';
import 'package:pinjem_in_app/features/notification/data/response/notification_response.dart';

class NotificationService {
  static Future<NotificationResponse> getNotification() async {
    try {
      final request = await dioClient
          .get<Map<String, dynamic>>('${Constants.baseUrl}notification');
      if (request.statusCode == 200) {
        final response = NotificationResponse.fromJson(request.data!);
        return response;
      } else {
        final response = NotificationResponse(status: request.statusCode);
        return response;
      }
    } on DioException catch (e) {
      final response =
          NotificationResponse(message: e.response!.data as String);
      return response;
    } catch (e) {
      final response = NotificationResponse(message: e.toString());
      return response;
    }
  }

  static Future<NotificationDetailCarResponse> getDetailCarResponse(
    String id,
  ) async {
    try {
      final request = await dioClient.get<Map<String, dynamic>>(
        '${Constants.baseUrl}/car-transaction/$id',
      );

      if (request.statusCode == 200) {
        final response = NotificationDetailCarResponse.fromJson(request.data!);
        return response;
      } else {
        final response =
            NotificationDetailCarResponse(message: 'GetDetailError');
        return response;
      }
    } on DioException catch (e) {
      log('car service dio ex${e.response!.data}');
      final response =
          NotificationDetailCarResponse(message: e.response!.data as String);
      return response;
    } catch (e) {
      log('car service catch $e');
      final response = NotificationDetailCarResponse(message: e.toString());
      return response;
    }
  }

  static Future<NotificationDetailRoomResponse> getDetailRoomResponse(
    String id,
  ) async {
    try {
      final request = await dioClient.get<Map<String, dynamic>>(
        '${Constants.baseUrl}/room-transaction/$id',
      );

      if (request.statusCode == 200) {
        final response = NotificationDetailRoomResponse.fromJson(request.data!);
        return response;
      } else {
        final response =
            NotificationDetailRoomResponse(message: 'GetDetailError');
        return response;
      }
    } on DioException catch (e) {
      log('service dio ex${e.response!.data}');
      final response =
          NotificationDetailRoomResponse(message: e.response!.data as String);
      return response;
    } catch (e) {
      log('service catch $e');
      final response = NotificationDetailRoomResponse(message: e.toString());
      return response;
    }
  }
}
