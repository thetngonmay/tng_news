import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thg_news/bloc/article/articles_bloc.dart';

import '../../model/home_list_model.dart';
import '../notification/notification_page.dart';
import 'home_list_view.dart';
import 'home_slider.dart';
import 'home_top_tab.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }

}
class MyHomePageState extends State<MyHomePage>{
  List<HomeListModel> dataList=[
    HomeListModel(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3wxJ0c-jC6VcDASO9aiDWD9zWAeJLKrS5gg&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUsbmTZu_uMrmJ0z--CrG-o1UIXytu1OCizQ&s',
        'Maureen O Hare',
        'The World Biggest Cruise Ship Is Almost Ready',
        '4 Hours Ago 3 Min',
        'Travel'
    ),
    HomeListModel(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1zwhySGCEBxRRFYIcQgvOLOpRGqrT3d7Qng&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZExXZfuy_mIpsM-T69cjwfWlNiY8MJK_shQ&s',
        'Jessie Yeung',
        'South Korea Is Cutting killer Questions',
        '12 Hours Ago 5 Min',
        'Education'
    ),
    HomeListModel(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1zwhySGCEBxRRFYIcQgvOLOpRGqrT3d7Qng&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZExXZfuy_mIpsM-T69cjwfWlNiY8MJK_shQ&s',
        'Maureen O Hare',
        'The World Biggest Cruise Ship Is Almost Ready',
        '4 Hours Ago 3 Min',
        'Travel'
    ),
    HomeListModel(
        'https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-118143566.jpg',
        'https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=',
        'Jessie Yeung',
        'South Korea Is Cutting killer Questions',
        '12 Hours Ago 5 Min',
        'Education'
    ),
    HomeListModel(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3wxJ0c-jC6VcDASO9aiDWD9zWAeJLKrS5gg&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUsbmTZu_uMrmJ0z--CrG-o1UIXytu1OCizQ&s',
        'Maureen O Hare',
        'The World Biggest Cruise Ship Is Almost Ready',
        '4 Hours Ago 3 Min',
        'Travel'
    ),
  ];
  int selectedTab = 0;

  void onTabChanged(int index) {
    setState(() {
      selectedTab = index;
    });
    }

  void fetchHeadline(){
    context.read<ArticlesBloc>().add(FetchArticles(query: "", country: "us"));
  }

  @override
  void initState() {
    fetchHeadline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://img.freepik.com/premium-photo/green-initial-letter-n-with-backbone-chiropractic-logo-design-vector-graphic-concept-illustrations_1029473-39023.jpg?semt=ais_hybrid&w=740",
              ),
              radius: 20,
            ),
          ),
          title: Text(
            "RNL",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            IconButton(onPressed: onSearchClick, icon: Icon(Icons.search)),
            IconButton(onPressed: onNotificationClick, icon: Icon(Icons.notifications_none)),
          ],
        ),
        body: ListView(
          children: [
            HomeSlider(),
            Container(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 15)),
                  HomeTopTab(selectedTab,
                  onTabChanged: onTabChanged,),
                  BlocBuilder<ArticlesBloc, ArticlesState>(
                    builder: (context, state){
                      if(state is ArticlesLoading){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if(state is ArticlesError){
                        return Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(state.message,)
                          ),
                        );
                      }
                      if(state is ArticlesLoaded){
                        return HomeListView(
                          listName: "Latest News",
                          data: state.articles,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
  

  void onSearchClick() {
  }

  void onNotificationClick() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>NotificationPage()));
  }
}