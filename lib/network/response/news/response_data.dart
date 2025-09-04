import 'article_data.dart';

class ArticleResponseData{
  final String status;
  final int totalResults;
  final List<ArticleData> articles;

  ArticleResponseData(this.status, this.totalResults, this.articles);

  factory ArticleResponseData.fromMap(Map<String, dynamic> map) {
    return ArticleResponseData(
        map['status']??"",
        map['totalResults']??0,
        (map['articles'] as List<dynamic>).map((article)=> ArticleData.fromMap(article)).toList()
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((article)=>article.toMap()).toList()
    };
  }
}