import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/dio_client.dart';
import 'package:pinjem_in_app/app/core/dio_interceptor.dart';
import 'package:pinjem_in_app/app/core/sharedpreference.dart';
import 'package:pinjem_in_app/features/auth/data/body/login_body.dart';
import 'package:pinjem_in_app/features/auth/data/body/register_body.dart';
import 'package:pinjem_in_app/features/auth/data/response/login_response.dart';
import 'package:pinjem_in_app/features/auth/data/response/register_response.dart';

class AuthService {
  static Future<void> _setBearerFromRequest(Map<String, dynamic> data) async {
    final token = (data['data'] as Map<String, dynamic>)['token'].toString();
    final userId = (data['data'] as Map<String, dynamic>)['id'].toString();
    log('Token: $token');
    log('User Id: $userId');
    await SharedPrefStore.setBearerToken(token);
    await SharedPrefStore.setUserId(userId);
  }

  static Future<LoginResponse> postLogin(LoginBody body) async {
    dioClient.interceptors.add(DioInterceptor());
    try {
      final request = await dioClient.post<Map<String, dynamic>>(
        '${Constants.baseUrl}login',
        data: body.toJson(),
      );

      log('Login Response: ${request.data}');

      if (request.statusCode == 200) {
        await _setBearerFromRequest(request.data!);
        log('Request Sent');
        final response = LoginResponse.fromJson(request.data!);
        return response;
      } else {
        final response = LoginResponse(message: 'Login Gagal!');
        return response;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        await SharedPrefStore.removeBearerToken();
        log('ERROR 401');
      } else if (e.response!.statusCode == 400) {
        final response =
            LoginResponse.fromJson(e.response!.data as Map<String, dynamic>);
        return response;
      }
      final response = LoginResponse(message: 'DioException: $e');
      return response;
    } catch (e) {
      log('$e');
      final response = LoginResponse(message: 'AuthServiceExceptopn: $e');
      return response;
    }
  }

  static Future<RegisterResponse> postRegister(RegisterBody body) async {
    try {
      final request = await dioClient.post<Map<String, dynamic>>(
        '${Constants.baseUrl}register',
        data: body.toJson(),
      );
      log('${request.data}');
      if (request.statusCode == 200) {
        final response = RegisterResponse.fromJson(request.data!);
        return response;
      } else {
        final response = RegisterResponse(message: 'Register Gagal');
        return response;
      }
    } on DioException catch (e) {
      final response =
          RegisterResponse.fromJson(e.response!.data as Map<String, dynamic>);
      return response;
    } catch (e) {
      final response = RegisterResponse(message: 'Catch $e');
      return response;
    }
  }
}
