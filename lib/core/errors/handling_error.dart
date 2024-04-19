import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/failure.dart';

// ignore: camel_case_types
class RequestFailure extends Failure {
  // ignore: non_constant_identifier_names
  RequestFailure({required super.errorMessage});
  factory RequestFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return RequestFailure(errorMessage: "لقد انتهي وقت الاتصال");
      case DioExceptionType.sendTimeout:
        return RequestFailure(errorMessage: "لقد انتهي وقت الارسال");
      case DioExceptionType.receiveTimeout:
        return RequestFailure(errorMessage: "لقد انتهي وقت الارسال");
      case DioExceptionType.badCertificate:
        return RequestFailure(errorMessage: "يوجد خطأ برجاء المحاوله لاحقا");
      case DioExceptionType.badResponse:
        return RequestFailure.fromresponse(
            dioException.response!.statusCode!, dioException.response!.data!);
      case DioExceptionType.cancel:
        return RequestFailure(errorMessage: "انتهي وقت محاولة الاتصال");

      case DioExceptionType.connectionError:
        return RequestFailure(errorMessage: "يوجد مشكله في الاتصال");

      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return RequestFailure(
              errorMessage: "يوجد مشكله في الاتصال بالانترنت");
        } else {
          return RequestFailure(
              errorMessage: "يوجد خطأ برجاء المحاوله مره اخري");
        }
      default:
        return RequestFailure(errorMessage: "يوجد خطأ برجاء المحاوله مره اخري");
    }
  }
  factory RequestFailure.fromresponse(int statuscode, dynamic respnse) {
    if (statuscode == 422 ||
        statuscode == 400 ||
        statuscode == 401 ||
        statuscode == 403) {
      return RequestFailure(errorMessage: respnse["error"]["message"]);
    } else if (statuscode == 404) {
      return RequestFailure(errorMessage: "الصفحه غير موجوده");
    } else if (statuscode == 500)
      // ignore: curly_braces_in_flow_control_structures
      return RequestFailure(errorMessage: "يوجد مشكله في السيرفر");
    else
      // ignore: curly_braces_in_flow_control_structures
      return RequestFailure(errorMessage: "برجاء المحاوله مرخ اخري");
  }
}
