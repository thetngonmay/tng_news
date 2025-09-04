import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return NotificationPageState();
  }
  
}
class NotificationPageState extends State<NotificationPage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Reading Detail"),
       actions: [
         IconButton(onPressed: onMoreClicl, icon: Icon(Icons.more_vert_outlined))
       ],
     ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               padding: EdgeInsets.only(left: 20,right: 40,bottom: 15),
               child: ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(1)),
                 child: CachedNetworkImage(
                   width: double.infinity,
                   height: 200,
                   fit: BoxFit.cover,
                   progressIndicatorBuilder: (context ,url ,progress)=>Center(
                     child: CircularProgressIndicator(
                       value: progress.progress,
                     ),
                   ),
                   imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfIOE5A9LUMhjglmmwaf3qjxhCriO-mMq6Hw&s",
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 8,right: 50),
               child: ListTile(
                 title: Text("Apple is Now Worth 3 Million,Boosted By The Nasdaqs Best Start in 40 YEars",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               ),
             ),
             SizedBox(
               height: 15,
             ),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(padding: EdgeInsets.only(left: 15)),
                 CircleAvatar(
                   radius: 15,
                   backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZExXZfuy_mIpsM-T69cjwfWlNiY8MJK_shQ&s"),
                 ),
                 SizedBox( width: 15,),
                 Text("By Nicole Goodkind . ",style: TextStyle(fontSize: 15),),
                 SizedBox( width: 10,),
                 Text("3 Min",style: TextStyle(fontSize: 15,color: Colors.grey),)
               ],
             ),
             SizedBox(height: 15,),
             Padding(
               padding: const EdgeInsets.only(left: 15,right: 10),
               child: Column(
                 children: [
                   Text("Apples stock ended trading Friday valued at 3 trillion , the only company ever to reach that milestone .It has been riding a Big Teach stock wave that has given the Nasdaq its best first half gain in 40 years."
                       "Shares of Apple rose more than 2% Friday at a record 193.97 With 15.7 billion shares outstanding ,that stock price pushed Apple to its historic market value"),
                  SizedBox(height: 10,),
                  Text("Apple has been here once before .On january 3,2022,Apple hit the 3 trillion mark during intraday trading,but it failed to close there .The company stock closed Thursday at a record high share price for "
                      "the third-straight day,but it merely budged 0.2% higher.Apple easily surpassed the 190.73 level it needed to break 3 trillion at Fridays market open.")
                 ],
               ),
             ),
            Row(
                children: [
                Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1,
                      offset: Offset(1, 1)
                  ),
                  ],
            ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: onLikeClick,
                      icon: Icon(Icons.thumb_up_alt_outlined),),
                    Text("128"),
                    SizedBox(width: 15,),
                    IconButton(onPressed: onBookMarkClick,
                      icon: Icon(Icons.bookmark_border),),
                  ],
                ),
                )
           ]
       ),
     ]
       ),
    ),
   );
   
  }
  

  void onMoreClicl() {
  }

  void onLikeClick() {
  }

  void onBookMarkClick() {
  }
}