import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  factory ApiException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return ApiException(message: "Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ApiException(message: "Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ApiException(message: "Receive timeout in connection with API server");
      case DioExceptionType.sendTimeout:
        return ApiException(message: "Send timeout in connection with API server");
      case DioExceptionType.connectionError:
        return ApiException(message: "No internet connection");
      case DioExceptionType.badResponse:
        return _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      default:
        return ApiException(message: "Something went wrong");
    }
  }

  static ApiException _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return ApiException(
            message: error['message'] ?? 'Bad request', statusCode: statusCode);
      case 401:
        return ApiException(
            message: error['message'] ?? 'Unauthorized', statusCode: statusCode);
      case 403:
        return ApiException(
            message: error['message'] ?? 'Forbidden', statusCode: statusCode);
      case 404:
        return ApiException(
            message: error['message'] ?? 'Not found', statusCode: statusCode);
      case 500:
        return ApiException(
            message: error['message'] ?? 'Internal server error',
            statusCode: statusCode);
      default:
        return ApiException(
            message: error['message'] ?? 'Oops something went wrong',
            statusCode: statusCode);
    }
  }

  @override
  String toString() => message;
}
