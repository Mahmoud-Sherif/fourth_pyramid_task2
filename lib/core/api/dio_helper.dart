import 'dart:io';

import 'package:dio/dio.dart';

class DioHelper {
  static final Dio _dio = Dio()..options.validateStatus = (v) => v! < 500;
//   (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//     (HttpClient client) {
//   client.badCertificateCallback =
//       (X509Certificate cert, String host, int port) => true;
//   return client;
// };

  static Future<Response<dynamic>> post(String path, {dynamic data}) async =>
      await _dio.post(path, data: data);

  static Future<Response<dynamic>> get(String path) async => _dio.get(path);
}
