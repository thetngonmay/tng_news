import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return SavePageState();
  }
  
}
class SavePageState extends State<SavePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save"),
      ),
    );
  }
  
}