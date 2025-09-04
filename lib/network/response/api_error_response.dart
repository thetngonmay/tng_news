class ApiErrorResponse{
  final String status;
  final String code;
  final String message;

  ApiErrorResponse(this.status, this.code, this.message);

  factory ApiErrorResponse.fromMap(Map<String, dynamic> map){
    return ApiErrorResponse(map['status'] as String, map['code'] as String, map['message'] as String);
  }
}