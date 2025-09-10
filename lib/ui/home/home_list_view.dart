import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:http/http.dart' show read;
import 'package:path/path.dart';
import 'package:path/path.dart' as data;
import 'package:thg_news/bloc/save/save_bloc.dart';
import 'package:thg_news/network/response/news/article_data.dart';
import 'package:thg_news/ui/home/news_detail.dart';

class HomeListView extends StatefulWidget {
  final List<ArticleData> data;

  const HomeListView({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => HomeListViewState();
}

class HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
          ...widget.data.map((homeData) {
            return BlocBuilder<SaveBloc, SaveState>(
              builder: (context, state) {
                bool isSaved=false;
                if(state is GetAllSavedArticleLoaded){
                  isSaved =state.articles.any((a)=>data.url == a.url);
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NewsDetail(data: homeData,)));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            imageUrl: homeData.urlToImage,
                            errorWidget: (context, _, _) {
                              return Container(
                                color: Colors.grey,
                              );
                            },
                            progressIndicatorBuilder: (context, url,
                                progress) =>
                                Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(
                                      homeData.urlToImage,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      homeData.source.name,
                                      style: TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Text(homeData.title),
                              SizedBox(height: 10),
                              Wrap(children: [Text(homeData.publishedAt)]),
                            ],
                          ),
                        ),
                        IconButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetail(data: homeData)));
                        },
                            icon: Icon(Icons.bookmark_border))
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

void onSaveClick() {}
