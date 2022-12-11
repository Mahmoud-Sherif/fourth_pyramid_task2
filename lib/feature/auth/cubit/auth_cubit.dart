import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_pyramid_task2/core/api/dio_consumer.dart';
import 'package:fourth_pyramid_task2/core/api/end_poinst.dart';

import '../../../config/routes/magic_router.dart';
import '../../../core/api/dio_helper.dart';
import '../../../widgets/snack_bar.dart';
import '../../scan/presentation/scan_view.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit of(context) => BlocProvider.of(context);
  String? phone;
  String? password;
  final formKey = GlobalKey<FormState>();
  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    emit(LoginLoading());
    final body = {
      "phone": phone,
      "password": password,
    };
    try {
      // DioConsumer dio = DioConsumer(client: Dio());
      final Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      // final response = await DioHelper.post(EndPoints.login, data: body);
      print(body);
      final response = await dio.post(
          'https://fourthpyramidagcy.net/company/api/v1/login-scanner',
          data: body);

      if (response.statusCode == 200 && response.data['status'] == 1) {
        // await AppStorage.cacheUserData(apiToken: response.data['data']['token']);
        MagicRouter.navigateAndPopAll(const ScanView());
      } else {
        showSnackBar(response.data['massage'], isError: true);
      }
    } on DioError catch (e) {
      showSnackBar(e.message, isError: true);
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
    }
    emit(LoginInit());
  }
}
