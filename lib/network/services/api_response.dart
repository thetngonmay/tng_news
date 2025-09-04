import 'package:thg_news/network/response/api_error_response.dart';

sealed class ApiResponse<S, E extends ApiErrorResponse>{
  const ApiResponse();
}

final class Success<S, E extends ApiErrorResponse> extends ApiResponse<S,E>{
  const Success(this.data);
  final S data;
}

final class Fail<S,E extends ApiErrorResponse> extends ApiResponse<S,E>{
  const Fail(this.error);
  final E error;
}