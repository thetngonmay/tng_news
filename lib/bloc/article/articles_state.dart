part of 'articles_bloc.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesLoaded extends ArticlesState {
  final List<ArticleData> articles;

  const ArticlesLoaded(this.articles);
  @override
 List<Object> get props => [articles];
}

final class ArticlesError extends ArticlesState {
  final String message;
  const ArticlesError(this.message);

  @override
  List<Object> get props => [message];
}