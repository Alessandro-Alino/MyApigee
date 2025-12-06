import 'dart:developer';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final String errMex = dioErrMex(err);
    log('ERR_DIO_INTER.: $errMex');
    return super.onError(err, handler);
  }
}

// Error Message from DioException
String dioErrMex(DioException err) {
  switch (err.type) {
    case DioExceptionType.connectionTimeout:
      return 'Timeout di connessione: ${err.message}';
    case DioExceptionType.sendTimeout:
      return 'Timeout di invio: ${err.message}';
    case DioExceptionType.receiveTimeout:
      return 'Timeout di ricezione: ${err.message}';
    case DioExceptionType.badResponse:
      return 'Risposta non valida: ${err.response?.statusCode} - ${err.response?.data}';
    case DioExceptionType.cancel:
      return 'Richiesta annullata: ${err.message}';
    case DioExceptionType.unknown:
      return 'Errore sconosciuto: ${err.message}';
    default:
      return 'Errore generico: ${err.message}';
  }
}
