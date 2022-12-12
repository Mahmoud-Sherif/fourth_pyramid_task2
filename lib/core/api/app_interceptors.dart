import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers = {
      'authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiM2VkODIyNTA1YjY0YWFhY2UwMmJmZWRjOWRiMzlhYWI1M2VlNjZmMmFjM2I4NDgxYWY5OTQ1NjlhZmRkN2I1M2YxYzYxYmJkNmIzOWQwMzciLCJpYXQiOjE2NzA3NTQyMDYsIm5iZiI6MTY3MDc1NDIwNiwiZXhwIjoxNzAyMjkwMjA2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.iKEJ7PrQjITrpB3867eojDaS0Nqnr5ntPMhjRL5r28X34XXX5VGvkzynixkG2YR0YBRNMbFo9IUArZDZ5fN5RHmqUewp62rk43cvOnvUHe9ycpHGAoAP9zQnciTLzrQ0nmFoHCh9VtopGadyJeXKL2iCJuuP9ebcEi9OtQrtJKs1iClxbcFkB0FUKGna0Wm3JhGlBbB1-bn-LcRGsnANRoUZ4-gb4iSSVTHsRfGJE7M0m4-cd408ZtwOEY-rGIKKUkuy3_DjfGU5wVI8B6nuCdDocjFzFOmE2L4hoGVuro0C2Vc7XbNDXKIWTAZSDLktOCYkx6oEasc5jYhSs3PQUlaWDN-ytBMwENAhV05B61IbwlYuM1ozy2Jxl3DxDl0YfFg1GOnNWavw60TWYwCFNp82lhPBt3jLtkiITj1hPZSFjyiRi7LK8xcLW2SIpSLdvq6tKlfs4lRYKNu5wLDisuemeq5nw3Ay-HxZaxI-fE7St1xsNJOosMmhYqmN0pv8Putlsx1czsnctjZ78UdmhTy2HUa4B4wGrMDyMfSeIkjyyEfmS_Ll4k_KTIsVyyC_sN7_D72WG8-fg5op3UPrApk94ofVkEggt6jdkIOPkLPaf2riVpDFshzzD1oM0IHBWpzjtNRDAvIZQ6Jkc5_Iq258_5aFKLBkmOW18c-gHDc'
    };
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
