import 'package:dio/dio.dart';

abstract class Faliure {
  final errorMessage;
  Faliure(this.errorMessage);
}

class ServerFaliure extends Faliure {
  ServerFaliure(super.errorMessage);

  factory ServerFaliure.fromDioError(DioException dioError) {
    if (dioError.type case DioExceptionType.connectionTimeout) {
      return ServerFaliure('Connection timeout with ApiServer');
    } else if (dioError.type case DioExceptionType.sendTimeout) {
      return ServerFaliure('Send timeout with Api');
    } else if (dioError.type case DioExceptionType.receiveTimeout) {
      return ServerFaliure('Receive timeout with Api');
    } else if (dioError.type case DioExceptionType.cancel) {
      return ServerFaliure('Request to ApiServer was canceld');
    } else if (dioError.type case DioExceptionType.badResponse) {
      return ServerFaliure.fromResponse(
          dioError.response!.statusCode!, dioError.response!.data);
    } else if (dioError.type case DioExceptionType.unknown) {
      if (dioError.message!.contains('SockteException')) {
        return ServerFaliure('No Internet connection');
      }
      return ServerFaliure('Unexpected error, Please try later');
    } else {
      return ServerFaliure('this is unKnown');
    }
  }
  factory ServerFaliure.fromResponse(int statesCode, dynamic response) {
    if (statesCode == 400 || statesCode == 401 || statesCode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (statesCode == 404) {
      return ServerFaliure('Your Request not found, please try later');
    } else if (statesCode == 500) {
      return ServerFaliure('Internal Server error, Please try later ');
    } else {
      return ServerFaliure('Opps there was an error, Please try later');
    }
  }
}
