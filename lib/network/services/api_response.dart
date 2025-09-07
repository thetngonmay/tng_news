import 'package:thg_news/network/response/api_error_response.dart';

sealed class ApiResponse<S, E extends ApiErrorResponse>{
  const ApiResponse();
}

final class Success<S, E extends ApiErrorResponse> extends ApiResponse<S,E>{
  final S data;
  const Success(this.data);
}

final class Fail<S,E extends ApiErrorResponse> extends ApiResponse<S,E>{
  final E error;
  const Fail(this.error);
}