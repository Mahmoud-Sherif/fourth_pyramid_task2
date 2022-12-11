import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fourth_pyramid_task2/core/api/status_code.dart';

import 'app_interceptors.dart';
import 'end_poinst.dart';

class DioConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(AppInterceptors());
    if (kDebugMode) {
      client.interceptors.add(LogInterceptor());
    }
  }

  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response;
    } on DioError catch (error) {
      print(error);
    }
  }

  Future post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return response;
    } on DioError catch (error) {
      print(error);
    }
  }

  // @override
  // Future put(String path,
  //     {Map<String, dynamic>? body,
  //     Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final response =
  //         await client.put(path, queryParameters: queryParameters, data: body);
  //     return _handleResponseAsJson(response);
  //   } on DioError catch (error) {
  //     _handleDioError(error);
  //   }
  // }

  // dynamic _handleResponseAsJson(Response<dynamic> response) {
  //   final responseJson = jsonDecode(response.data.toString());
  //   return responseJson;
  // }
}
