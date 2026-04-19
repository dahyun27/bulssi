import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

final dioClientProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  dio.interceptors.addAll([
    AuthInterceptor(),
    ErrorInterceptor(),
  ]);
  return dio;
});
