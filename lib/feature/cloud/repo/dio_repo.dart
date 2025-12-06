import 'package:dio/dio.dart';
import 'package:myapigee/feature/cloud/repo/error_interceptor.dart';

class AppDio {
  // Istanza singleton
  static final AppDio _instance = AppDio._internal();

  // Factory per restituire sempre la stessa istanza
  factory AppDio() => _instance;

  // Istanza di Dio
  final Dio dio;

  // Costruttore privato
  AppDio._internal()
    : dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          sendTimeout: Duration(seconds: 10),
        ),
      ) {
    // Error handling interceptor
    dio.interceptors.add(
      ErrorInterceptor(),
    );
    // Log Interceptor
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
