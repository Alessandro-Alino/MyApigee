import 'package:dio/dio.dart';

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
    // // Aggiungi interceptor per logging, error handling, ecc.
    // dio.interceptors.add(
    //   LogInterceptor(
    //     request: true,
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: true,
    //     responseBody: true,
    //     error: true,
    //   ),
    // );
  }
}
