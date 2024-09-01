import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/dio_client.dart';
import 'package:pinjem_in_app/app/core/dio_interceptor.dart';
import 'package:pinjem_in_app/app/core/sharedpreference.dart';
import 'package:pinjem_in_app/features/profile/data/response/get_profile_response.dart';

class UserProfileService {
  static Future<UserApiResponse> getUserApiData(String id) async {
    dioClient.interceptors.add(DioInterceptor());
    try {
      final request = await dioClient
          .get<Map<String, dynamic>>('${Constants.baseUrl}/user/$id');
      if (request.statusCode == 200) {
        final result = UserApiResponse.fromJson(request.data);
        return result;
      } else {
        final result = UserApiResponse(status: 404);
        return result;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        await SharedPrefStore.removeBearerToken();
        log('Get User 401');
      }
      final result = UserApiResponse(status: 401);
      return result;
    } catch (e) {
      log('Error Get User $e');
      final result = UserApiResponse(status: 404);
      return result;
    }
  }
}
