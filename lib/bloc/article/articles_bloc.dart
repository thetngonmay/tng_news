import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thg_news/network/repository/article_repository.dart';
import 'package:thg_news/network/response/api_error_response.dart';
import 'package:thg_news/network/response/news/response_data.dart';
import 'package:thg_news/network/services/api_response.dart';

import '../../network/response/news/article_data.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticleRepository repo;

  ArticlesBloc(this.repo) : super(ArticlesInitial()) {

    on<FetchArticles>(_fetchHeadLine);

  }

  Future<void> _fetchHeadLine(
      FetchArticles event,
      Emitter<ArticlesState> emit
  ) async {
    emit(ArticlesLoading());

    final response = await repo.fetchHeadline(query: event.query, country: event.country);

    if(response is Success<ArticleResponseData, ApiErrorResponse>){
      emit(ArticlesLoaded(response.data.articles));
    }else if (response is Fail<ArticleResponseData, ApiErrorResponse>){
      emit(ArticlesError(response.error.message));
    }

  }
























}
