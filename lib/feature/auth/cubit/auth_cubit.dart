import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_pyramid_task2/core/api/end_poinst.dart';

import '../../../config/routes/magic_router.dart';
import '../../../core/api/dio_helper.dart';
import '../../../widgets/snack_bar.dart';
import '../../qr/presentation/scan/scan_view.dart';
import '../data/localdata/auth_local_data.dart';

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
      final DioHelper dio = DioHelper(client: Dio());
      final response = await dio.post(
        EndPoints.login,
        data: body,
      );
      if (response.statusCode == 200 && response.data['status'] == 1) {
        await AppStorage.cacheUserData(
          phone: response.data['data']['user']['phone'],
          apiToken: response.data['data']['token'],
          uid: response.data['data']['user']['id'],
        );
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
