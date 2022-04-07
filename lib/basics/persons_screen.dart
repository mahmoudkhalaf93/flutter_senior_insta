import 'package:flutter/material.dart';

class PesronsScreen extends StatelessWidget {
String _url = "https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Persons'
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(5.0,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildPerson(name: "ahmed"),
              buildPerson(name: "ali"),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),
              buildPerson(),

            ],
          ),
        ),
      ),

    );


  }}

  Widget buildPerson({String name ="mohamed"}){


  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    child:
    Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );

  }