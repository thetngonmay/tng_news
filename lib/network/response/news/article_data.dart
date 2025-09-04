
import 'package:thg_news/network/response/news/source_data.dart';

class ArticleData{
  final SourceData source;
  final String author;
  final String title;
  final String  description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleData(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);

  factory ArticleData.fromMap(Map<String, dynamic> map){
    return ArticleData(
      SourceData.fromMap(map['source']),
      map['author']??"",
      map['title']??"",
      map ['description']??"",
      map['url']??"",
      map['urlToImage']??"",
      map ['publishedAt']??"",
      map['content']??"",
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'source': source.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url':url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}