import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return DiscoverPageState();
  }
  
}
class DiscoverPageState extends State<DiscoverPage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Discover"),
     ),
   );
  }
  
}