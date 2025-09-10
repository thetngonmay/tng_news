part of 'save_bloc.dart';

sealed class SaveEvent extends Equatable {

  const SaveEvent();
  @override

  List<Object?> get props => [];

}
class SaveArticleEvent extends SaveEvent{
  final ArticleData article;

  const SaveArticleEvent(this.article);
  @override
  List<Object?> get props => [article];

}
class UnSaveArticleEvent extends SaveEvent{
  final String url;

  const UnSaveArticleEvent(this.url);
  @override
  List<Object?> get props => [url];
}
class CheckSavedStatusEvent extends SaveEvent{
  final String url;

  const CheckSavedStatusEvent(this.url);
  @override
  List<Object?> get props => [url];
}
class GetAllSavedArticleEvent extends SaveEvent{

}
