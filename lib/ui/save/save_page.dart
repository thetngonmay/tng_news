import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thg_news/bloc/save/save_bloc.dart';
import 'package:thg_news/ui/home/home_list_view.dart';

class SavePage extends StatefulWidget{
  const SavePage({super.key});
  @override
  State<StatefulWidget> createState() {
   return SavePageState();
  }
  
}
class SavePageState extends State<SavePage> {
  void fetchSavedList() {
    context.read<SaveBloc>().add(GetAllSavedArticleEvent());
  }

  @override
  void initState() {
    super.initState();
    fetchSavedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save List View"),
      ),
      body: BlocBuilder<SaveBloc, SaveState>(
          builder: (context, state) {
            if (state is GetAllArticlesLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetAllSavedArticleLoaded) {
              return HomeListView(data: state.articles);
            }
            return SizedBox.shrink();
          }
      ),
    );
  }
}