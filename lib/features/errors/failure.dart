import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioErrorType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode ?? 500,
          e.response?.data,
        );
      case DioErrorType.cancel:
        return ServerFailure('Request to API server was canceled');
      case DioErrorType.connectionError:
        return ServerFailure('No internet connection');
      case DioErrorType.unknown:
      default:
        return ServerFailure('Oops, there was an error. Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('There is a problem with the server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response?['error']?['message'] ?? 'Unauthorized request');
    } else {
      return ServerFailure('There was an error, please try again');
    }
  }
}