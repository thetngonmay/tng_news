import 'dart:convert';

import 'package:http/http.dart';

import '../response/api_error_response.dart';
import 'api_response.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class API{
  Client client = Client();
  final String apiKey = '';

  Map<String, String> _mergeHeaders(Map<String, String>? headers){
    return {
      'Content-Type': 'application/json',
      ...?headers
    };
  }

  String _appendApiKey(String url, [Map<String,String>? queryParams]){
    final uri = Uri.parse(url);
    final updatedQuery = {
      ...uri.queryParameters,
      'apiKey':apiKey,
      ...?queryParams,
    };

    final newUri = uri.replace(queryParameters:  updatedQuery);
    return newUri.toString();
  }

  ApiResponse<T, ApiErrorResponse> _handleResponse<T>(
      Response response,
      FromJson<T> fromJson,
  ){
    final data = jsonDecode(response.body);
    if(response.statusCode >=200 && response.statusCode < 300){
      return Success(fromJson(data));
    }else {
      return Fail(ApiErrorResponse.fromMap(data));
    }
  }

  Future<ApiResponse<T, ApiErrorResponse>> get<T>(
      String url, {
        required FromJson<T> fromJson,
        Map<String,String>? headers,
        Map<String, String>? queryParams
  }) async {
    try {
      final uri = Uri.parse(_appendApiKey(url, queryParams));
      final response = await client.get(uri, headers: _mergeHeaders(headers));
      return _handleResponse(response, fromJson);
    }catch(e){
      return Fail(ApiErrorResponse('error', 'client_error', e.toString()));
    }
  }

  Future<ApiResponse<T, ApiErrorResponse>> post<T>(
      String url, {
        required Map<String,dynamic> body,
        required FromJson<T> fromJson,
        Map<String, String>? headers,
  }) async {
    try{
      final uri = Uri.parse(_appendApiKey(url));
      final response = await client.post(
        uri,
        headers: _mergeHeaders(headers),
        body: jsonEncode(body),
      );

      return _handleResponse(response, fromJson);

    }catch (e){
      return Fail(ApiErrorResponse('error', 'client_error', e.toString()));
    }
  }

  Future<ApiResponse<T,ApiErrorResponse>> put<T>(
      String url, {
      required Map<String, dynamic> body,
      required FromJson<T> fromJson,
      Map<String, String>? headers,
  }) async {
    try{
      final uri = Uri.parse(_appendApiKey(url));
      final response = await client.put(uri, headers: _mergeHeaders(headers), body: jsonEncode(body));
      return _handleResponse(response, fromJson);
    }catch(e){
      return Fail(ApiErrorResponse('error', 'client_error', e.toString()));
    }
  }

  Future<ApiResponse<T,ApiErrorResponse>> delete<T>(
      String url, {
        required FromJson<T> fromJson,
        Map<String, String>? headers,
      }) async {
    try{
      final uri = Uri.parse(_appendApiKey(url));
      final response = await client.delete(uri, headers: _mergeHeaders(headers));
      return _handleResponse(response, fromJson);
    }catch(e){
      return Fail(ApiErrorResponse('error', 'client_error', e.toString()));
    }
  }
























}