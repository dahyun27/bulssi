import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Firebase Auth 토큰 주입 예정
    handler.next(options);
  }
}
