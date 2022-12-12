import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_pyramid_task2/core/api/dio_helper.dart';
import 'package:fourth_pyramid_task2/core/api/end_poinst.dart';
import 'package:fourth_pyramid_task2/feature/qr/data/scan_result_model.dart';
import '../../../widgets/snack_bar.dart';
part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());
  static QrCubit of(context) => BlocProvider.of(context);
  final DioHelper dio = DioHelper(client: Dio());
  String? qrCode;
  Future<void> getScans() async {
    emit(QrResultLoading());
    try {
      final response = await dio.get(EndPoints.myScans);
      if (response.statusCode == 200) {
        /*
          مفروض اعمل كاش هنا
          علشان معملش ريكوست كل اما اخش علي الاسكرين ومفيش اي كود جديد
            بس مفيش وقت
        */
        emit(
          QrResultLoaded(
            scanResult: ScanResultModel.fromJson(response.data),
          ),
        );
      } else {
        emit(QrInitial());
        showSnackBar(response.data['massage'], isError: true);
      }
    } on DioError catch (e) {
      emit(QrInitial());

      showSnackBar(e.message, isError: true);
    } catch (e) {
      emit(QrInitial());

      showSnackBar(e.toString(), isError: true);
    }
  }

  Future<void> postScans() async {
    emit(QrScanLoading());
    try {
      qrCode = getRandomString(10);
      final body = {"code": qrCode};
      final response = await dio.post(EndPoints.postScan, data: body);
      if (response.statusCode == 200 && response.data['status'] == 1) {
        emit(QrScanLoaded());
        showSnackBar(response.data['massage'], isError: false);
      } else {
        emit(QrInitial());
        showSnackBar(response.data['massage'], isError: true);
      }
    } on DioError catch (e) {
      emit(QrInitial());

      showSnackBar(e.message, isError: true);
    } catch (e) {
      emit(QrInitial());

      showSnackBar(e.toString(), isError: true);
    }
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
