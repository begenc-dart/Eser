import 'package:dio/dio.dart';

class FetchException implements Exception {
  final String message;
  final int? statusCode;
  final DioErrorType? dioErrorType;
  final dynamic error;

  FetchException({
    required this.message,
    this.statusCode,
    this.dioErrorType,
    this.error,
  });

  factory FetchException.fromDioError(DioError dioError) {
    String message;
    int? statusCode;
    DioErrorType? dioErrorType;

    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        message = 'Request timed out. Please check your internet connection.';
        break;
      case DioErrorType.badResponse:
        statusCode = dioError.response?.statusCode;
        message = _handleStatusCode(statusCode);
        break;
      case DioErrorType.cancel:
        message = 'Request was cancelled.';
        break;
      case DioErrorType.connectionError:
        message = 'Failed to connect to the server. Please check your network.';
        break;
      case DioErrorType.badCertificate:
        message = 'Invalid server certificate.';
        break;
      case DioErrorType.unknown:
      default:
        message = 'An unexpected error occurred: ${dioError.message}';
        break;
    }

    return FetchException(
      message: message,
      statusCode: statusCode,
      dioErrorType: dioError.type,
      error: dioError.error,
    );
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check the provided data.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Forbidden. You do not have permission to perform this action.';
      case 404:
        return 'Resource not found.';
      case 429:
        return 'Too many requests. Please try again later.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'Request failed with status code: $statusCode';
    }
  }

  @override
  String toString() {
    return 'FetchException: $message${statusCode != null ? ' (Status Code: $statusCode)' : ''}${dioErrorType != null ? ' (Type: $dioErrorType)' : ''}';
  }
}