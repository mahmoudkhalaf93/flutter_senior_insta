import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(

        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                children:[
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      margin: EdgeInsets.all(10.0),

                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.indigo,
                      margin: EdgeInsets.all(10.0),

                    ),
                  ),
                ],

              ),


            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,

            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,

            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,

            ),
          ),
        ],
      ),

    );





  }}