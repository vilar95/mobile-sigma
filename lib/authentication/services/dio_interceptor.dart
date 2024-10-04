import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sigma/authentication/services/dio_endpoints.dart';

class DioInterceptor extends Interceptor {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String log = "";
    log += "REQUISIÇÃO\n";
    log += "Timestamp: ${DateTime.now()}\n";
    log += "Método: ${options.method}\n";
    log += "URL: ${options.uri}\n";
    log +=
        "Header: ${const JsonEncoder.withIndent("  ").convert(options.headers)}\n";
    if (options.data != null) {
      log += "Body: ${const JsonEncoder.withIndent("  ").convert(
        json.decode(options.data),
      )}\n";
    }
    _logger.w(log);
    Dio().post(
      "${DioEndpoints.baseUrl}${DioEndpoints.logs}",
      data: {
        "request": log,
      },
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String log = "";
    log += "RESPOSTA\n";
    log += "Timestamp: ${DateTime.now()}\n";
    log += "Status Code: ${response.statusCode}\n";
    log += "Data: ${const JsonEncoder.withIndent("  ").convert(response.data)}\n";
    _logger.i(log);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String log = "";
    log += "ERRO\n";
    log += "Timestamp: ${DateTime.now()}\n";
    log += "Mensagem: ${err.message}\n";
    if (err.response != null) {
      log += "Status Code: ${err.response?.statusCode}\n";
      log += "Data: ${const JsonEncoder.withIndent("  ").convert(err.response?.data)}\n";
    }
    _logger.e(log);
    super.onError(err, handler);
  }
}