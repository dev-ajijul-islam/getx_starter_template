import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_endpoints.dart';
import 'api_exception.dart';

class ApiClient {
  ApiClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: <String, dynamic>{'Content-Type': 'application/json'},
    ),
  )..interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          final apiException = ApiException.fromDioError(e);
          return handler.next(DioException(
            requestOptions: e.requestOptions,
            error: apiException,
            message: apiException.message,
            type: e.type,
          ));
        },
      ),
    ]);

  // GET Method
  static Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  // POST Method
  static Future<Response> post(String url, {dynamic data}) async {
    try {
      return await dio.post(url, data: data);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  // PUT Method
  static Future<Response> put(String url, {dynamic data}) async {
    try {
      return await dio.put(url, data: data);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  // DELETE Method
  static Future<Response> delete(String url) async {
    try {
      return await dio.delete(url);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }
}
