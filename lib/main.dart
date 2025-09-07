import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thg_news/bloc/app_bloc_observer.dart';
import 'package:thg_news/bloc/article/articles_bloc.dart';
import 'package:thg_news/network/repository/article_repository.dart';
import 'package:thg_news/network/services/api.dart';
import 'package:thg_news/ui/home/main_tab_page.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ArticlesBloc>(create: (context) => ArticlesBloc(ArticleRepository(API()))),
        ],
        child:  MaterialApp(
          title: 'Tnm Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          ),
          home: MainTabPage(),
        )
    );
  }
}

