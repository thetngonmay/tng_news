import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thg_news/database/generic_dao.dart';
import 'package:thg_news/network/response/news/article_data.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  final saveDao=GenericDao(
      tableName: 'save_articles',
      uniqueColumn: 'url',
      fromMap: (map)=> ArticleData.fromDb(map)
  );
  SaveBloc() : super(SaveInitial()) {

    on<SaveArticleEvent>((event, emit) async{
      await saveDao.insert(event.article);
      emit(SaveArticleSuccessState());
    });

    on<UnSaveArticleEvent>((event, emit)async{
      await saveDao.delete(event.url);
      emit(UnsaveArticleSuccessState());
    });
    on<CheckSavedStatusEvent>((event, emit)async{
      final exists = await saveDao.exists(event.url);
      emit(SaveStatusChecked(exists));
    });
    on<GetAllSavedArticleEvent>((event,emit)async{
      emit(GetAllArticlesLoadingState());
        final savedList = await saveDao.getAll();
        emit(GetAllSavedArticleLoaded(savedList));
      });
  }
}
