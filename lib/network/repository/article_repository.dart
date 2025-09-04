import 'package:thg_news/network/response/api_error_response.dart';
import 'package:thg_news/network/services/api.dart';
import 'package:thg_news/network/services/api_endpoint.dart';
import 'package:thg_news/network/services/api_response.dart';

import '../response/news/response_data.dart';

class ArticleRepository {
  final API api;
  ArticleRepository(this.api);

  Future<ApiResponse<ArticleResponseData, ApiErrorResponse>> fetchHeadline({
    required String query,
    required String country,
}){
    final url = "${EndPoint.topHeadline(country)}&q=$query";
    return api.get<ArticleResponseData>(url, fromJson: (json) => ArticleResponseData.fromMap(json));
  }

}