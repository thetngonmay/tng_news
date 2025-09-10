part of 'save_bloc.dart';

sealed class SaveState extends Equatable {
  const SaveState();
  @override

  List<Object?> get props => [];
}

final class SaveInitial extends SaveState {}

final class SaveArticleSuccessState extends SaveState{}

final class UnsaveArticleSuccessState extends SaveState{}

final class SaveStatusChecked extends SaveState{
  final bool isSaved;
  const SaveStatusChecked(this.isSaved);
  @override

  List<Object?> get props => [isSaved];

}
 final class GetAllArticlesLoadingState extends SaveState{ }

 final class GetAllSavedArticleLoaded extends SaveState{
  final List<ArticleData> articles;

  const GetAllSavedArticleLoaded(this.articles);
  @override
  List<Object?> get props => [articles];
}
