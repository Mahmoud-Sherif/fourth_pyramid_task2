import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fourth_pyramid_task2/core/api/status_code.dart';
import 'app_interceptors.dart';

class DioHelper {
  final Dio client;
  DioHelper({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    // client.options
    //   ..responseType = ResponseType.plain
    //   ..followRedirects = false
    //   ..validateStatus = (status) {
    //     return status! < StatusCode.internalServerError;
    //   };
    client.interceptors.add(AppInterceptors());
    if (kDebugMode) {
      client.interceptors.add(LogInterceptor());
    }
  }
  Future<Response<dynamic>> post(String path, {dynamic data}) async =>
      await client.post(path, data: data);
  Future<Response<dynamic>> get(String path) async => client.get(path);
}
