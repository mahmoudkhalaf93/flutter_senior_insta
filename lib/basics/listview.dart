import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
    body: ListView.builder(itemBuilder: (context, index){
      return Text(
      "mohamed ${++index}",
style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 22.0,
),
      );
},
itemCount:1000 ,
),
    );
  }
}
