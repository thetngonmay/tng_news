import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/home_model.dart';

class HomeSlider extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomeSliderState();
  }

}
class HomeSliderState extends State<HomeSlider>{
 List<HomeModel> homeDataList=[
   HomeModel(
       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIOE5A9LUMhjglmmwaf3qjxhCriO-mMq6Hw&s',
       'Apple is Now Worth 3 Trillion,Boosted By The Nasdaq Best Start in 40 Years',
       '3 Min',
       'By Nicole Goodkind'),
   HomeModel(
       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIOE5A9LUMhjglmmwaf3qjxhCriO-mMq6Hw&s',
       'Apple is Now Worth 3 Trillion,Boosted By The Nasdaq Best Start in 40 Years',
       '3 Min',
       'By Nicole Goodkind'),
   HomeModel(
       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIOE5A9LUMhjglmmwaf3qjxhCriO-mMq6Hw&s',
       'Apple is Now Worth 3 Trillion,Boosted By The Nasdaq Best Start in 40 Years',
       '3 Min',
       'By Nicole Goodkind'),
   HomeModel(
       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIOE5A9LUMhjglmmwaf3qjxhCriO-mMq6Hw&s',
       'Apple is Now Worth 3 Trillion,Boosted By The Nasdaq Best Start in 40 Years',
       '3 Min',
       'By Nicole Goodkind'),

 ];
 PageController?controller;
 int currentPage=0;
 Timer? autoSlideTimer;
 @override
  void initState() {
    controller=PageController(initialPage: 0)
    ..addListener((){
      int nextPage = controller!.page!.round();
      if(currentPage != nextPage){
        setState(() {
          currentPage= nextPage;
        });
      }
    });
    autoSlideTimer=Timer.periodic(Duration(seconds:5 ),(timer) {
      if (controller != null && controller!.hasClients) {
        int nextPage = (currentPage + 1) % homeDataList.length;
        controller?.animateToPage(
            nextPage, duration: Duration(seconds: 5), curve: Curves.easeInOut);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 270,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              ...homeDataList.map((homeData){
                return Padding(
                    padding: EdgeInsets.zero,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      CachedNetworkImage(
                       width: 400,
                       height: 300,
                       fit: BoxFit.cover,
                       imageUrl: homeData.imageUrl,
                       progressIndicatorBuilder: (context,url,progress)=>Center(
                         child: CircularProgressIndicator(
                           value: progress.progress,
                         ),
                       ),
                      ),
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 20,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundImage: NetworkImage("https://www.shutterstock.com/image-photo/business-speech-happy-black-woman-260nw-2617770713.jpg",),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    "${homeData.description}.${homeData.duration} Min",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(homeData.title,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                          )
                    ],
                  ),

                    );
              })
            ],
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Row(
              children: List.generate(homeDataList.length,(index){
                return Padding(
                  padding: EdgeInsets.all(3),
                  child: GestureDetector(
                    onTap: (){
                      controller?.animateToPage(index, duration: Duration(microseconds: 300), curve: Curves.easeInOut);
                    },
                    child: AnimatedContainer(
                      duration:  Duration(microseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      width: currentPage == index ? 12 : 8,
                      height: currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage ==index ? Colors.grey:Colors.grey[400]
                      ),

                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),

    );
  }

}
