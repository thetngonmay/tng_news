import 'package:flutter/material.dart';
import '../Discover/discover_page.dart';
import '../profile/profile_page.dart';
import '../save/save_page.dart';
import 'my_home_page.dart';

class MainTabPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return MainTabPageState();
  }

}
class MainTabPageState extends State<MainTabPage>{
  var _tabSelectedIndex=0;
  PageController? controller;
  @override
  void initState() {
    controller=PageController(initialPage: 0);
    super.initState();
  }
  void _onTab(int value){
    setState(() {
      _tabSelectedIndex=value;
    });
    controller?.jumpToPage(value);
  }
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: PageView(
       physics: NeverScrollableScrollPhysics(),
       controller: controller,
       onPageChanged: _onTab,
       children: <Widget>[
         MyHomePage(),
         DiscoverPage(),
         SavePage(),
         ProfilePage()
       ],
     ),
     bottomNavigationBar: BottomNavigationBar(
         currentIndex: _tabSelectedIndex,
       onTap: _onTab,
       type: BottomNavigationBarType.fixed,
       items: [
         BottomNavigationBarItem(
             icon: Icon(Icons.home_outlined),
             activeIcon: Icon(Icons.home_filled),
           label: "Home"
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.dangerous_outlined),
           activeIcon: Icon(Icons.dangerous),
           label: "Discover"
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.save_outlined),
             activeIcon: Icon(Icons.save_rounded),
             label: "Save"
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.person_outline),
           activeIcon: Icon(Icons.person),
           label: "Profile"
         )
       ],
     ),
   );
  }

}