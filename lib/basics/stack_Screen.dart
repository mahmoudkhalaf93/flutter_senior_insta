import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 12.0,
            ),

          ],
        ),
      ),
    );


  }}