import 'dart:developer';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    log('[ERR_DIO]: ${err.response?.statusCode} - ${err.response?.data}');
    if (response != null) {
      // Get Error Message
      final String errorMex = statusErrorResponse(response.statusCode);
      // Create new DioExeption instance with custom message
      final customError = err.copyWith(message: errorMex);
      // Reject the request with the custom error
      handler.next(customError);
    } else {
      // Create new DioExeption instance with custom message
      final customError = err.copyWith(
        message: 'Server Not Reachable. Prpbably the project is Paused.',
      );
      // Reject the request with the custom error
      handler.next(customError);
    }
  }
}

String statusErrorResponse(int? statusCode) {
  switch (statusCode) {
    case 401:
      return 'Unauthorized.';
    case 403:
      return 'Forbidden.';
    case 404:
      return 'Not Found.';
    default:
      return 'Server Error.';
  }
}
