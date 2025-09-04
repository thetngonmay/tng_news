part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class FetchArticles extends ArticlesEvent{
  final String query;
  final String country;
  const FetchArticles({required this.query, required this.country});

  @override
  List<Object> get props => [query, country];
}