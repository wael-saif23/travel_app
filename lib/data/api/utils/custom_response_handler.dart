import 'package:dio/dio.dart';

import '../../../core/utils/logger.dart';
import 'custom_show_error_toast.dart';

Future<void> responseHandler({
  required Future<dynamic> Function() apiRequest,
  void Function()? onStart,
  required Function(dynamic) onSuccess,
  required Function(dynamic) onError,
}) async {
  try {
    onStart?.call();
    Map<String, dynamic> result = await apiRequest();
    if (successValid(result)) {
      onSuccess(result);
    } else {
      onError(messageValid(result));
    }
  } on DioException catch (e, stackTrace) {
    logger
      ..e('DioException erorr ${e.response?.statusCode}')
      ..e('DioException erorr $e')
      ..e('DioException stackTrace $stackTrace');
    onError(errorHandler(handleStatusCode(e.response?.statusCode)));
  } on Exception catch (e) {
    logger.e('Exception erorr $e');
    onError(errorHandler(e.toString()));
  }
}

bool successValid(Map<String, dynamic> result) {
  bool success = result.containsKey('Success')
      ? result['Success']
      : result.containsKey('success')
          ? result['success']
          : false;
  return success;
}

String messageValid(Map<String, dynamic> result) {
  String message = result.containsKey('Message')
      ? result['Message']
      : result.containsKey('message')
          ? result['message'] ?? ''
          : 'حدث خطأ يرجى المحاولة مجدداً';
  return message;
}

String handleStatusCode(int? statusCode) {
  switch (statusCode) {
    case 400:
      return 'Bad request.';
    case 401:
      return 'Authentication failed.';
    case 403:
      return 'The authenticated user is not allowed to access the specified API endpoint.';
    case 404:
      return 'The requested resource does not exist.';
    case 405:
      return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
    case 415:
      return 'Unsupported media type. The requested content type or version number is invalid.';
    case 422:
      return 'Data validation failed.';
    case 429:
      return 'Too many requests.';
    case 204:
      return 'No Content';
    case 500:
      return 'Internal server error.';
    default:
      return 'Oops something went wrong!';
  }
}
