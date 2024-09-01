import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/dio_client.dart';
import 'package:pinjem_in_app/app/core/dio_interceptor.dart';
import 'package:pinjem_in_app/app/core/sharedpreference.dart';
import 'package:pinjem_in_app/features/home/data/response/pinjam_mobil_response.dart';
import 'package:pinjem_in_app/features/home/data/response/pinjam_ruangan_response.dart';
import 'package:pinjem_in_app/features/pinjam_mobil/data/body/pinjam_mobil_body.dart';
import 'package:pinjem_in_app/features/pinjam_mobil/data/response/pinjam_mobil_response.dart';
import 'package:pinjem_in_app/features/pinjam_ruangan/data/body/pinjam_ruangan_body.dart';
import 'package:pinjem_in_app/features/pinjam_ruangan/data/response/pinjam_ruangan_response.dart';

class PinjamRuanganService {
  static Future<PinjamRuanganResponse> getPinjamRuanganData() async {
    dioClient.interceptors.add(DioInterceptor());
    try {
      final request = await dioClient
          .get<Map<String, dynamic>>('${Constants.baseUrl}/room-transaction');
      if (request.statusCode == 200) {
        final result = PinjamRuanganResponse.fromJson(request.data);
        return result;
      } else {
        final result = PinjamRuanganResponse(status: 404);
        return result;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        await SharedPrefStore.removeBearerToken();
        log('Get Pinjam Ruangan 401');
      }
      final result = PinjamRuanganResponse(status: 404);
      return result;
    } catch (e) {
      log('GetPinjamRuanganCatch: $e');
      final result = PinjamRuanganResponse(status: 404);
      return result;
    }
  }

  static Future<PostPinjamRuanganResponse> postPinjamRuanganBody(
    PinjamRuanganBody body,
  ) async {
    try {
      final request = await dioClient.post<Map<String, dynamic>>(
        '${Constants.baseUrl}/room-transaction',
        data: body.toJson(),
      );
      log('${body.toJson()}');
      log('Post Pinjam Ruangan Response: ${request.data}');
      if (request.statusCode == 200) {
        log('200: ${request.data}');
        final response = PostPinjamRuanganResponse.fromJson(request.data!);
        return response;
      } else {
        log('else: ${request.data}');
        final response = PostPinjamRuanganResponse.fromJson(request.data!);
        return response;
      }
    } on DioException catch (e) {
      log('post dio excepton${e.response!.data}');
      final response = PostPinjamRuanganResponse(message: e.toString());
      return response;
    } catch (e) {
      log('post catch: $e');
      final response = PostPinjamRuanganResponse(message: e.toString());
      return response;
    }
  }
}

class PinjamMobilService {
  static Future<PinjamMobilResponse> getPinjamMobilData() async {
    try {
      final request = await dioClient
          .get<Map<String, dynamic>>('${Constants.baseUrl}/car-transaction');

      if (request.statusCode == 200) {
        final result = PinjamMobilResponse.fromJson(request.data);
        return result;
      } else {
        final result = PinjamMobilResponse(status: 404);
        return result;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        await SharedPrefStore.removeBearerToken();
        log('Get Pinjam Mobil 401');
      }
      final result = PinjamMobilResponse(status: 404);
      return result;
    } catch (e) {
      final result = PinjamMobilResponse(status: 404);
      return result;
    }
  }

  static Future<PostPinjamMobilResponse> postPinjamMobilBody(
    PinjamMobilBody body,
  ) async {
    try {
      final request = await dioClient.post<Map<String, dynamic>>(
        '${Constants.baseUrl}/car-transaction',
        data: body.toJson(),
      );
      log('Post Pinjam Mobil Response: ${request.data}');
      if (request.statusCode == 200) {
        log('200: ${request.data}');
        final response = PostPinjamMobilResponse.fromJson(request.data!);
        return response;
      } else {
        log('else: ${request.data}');
        final response = PostPinjamMobilResponse.fromJson(request.data!);
        return response;
      }
    } on DioException catch (e) {
      log('post dio excepton${e.response!.data}');
      final response = PostPinjamMobilResponse(message: e.toString());
      return response;
    } catch (e) {
      log('post catch: $e');
      final response = PostPinjamMobilResponse(message: e.toString());
      return response;
    }
  }
}
