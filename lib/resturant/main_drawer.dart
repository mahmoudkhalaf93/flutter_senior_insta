import 'package:flutter/material.dart';
import 'package:flutter_senior/resturant/booking_screen.dart';
import 'package:flutter_senior/resturant/rate_bar.dart';
import 'package:flutter_senior/resturant/resturant_screen.dart';

class MainDrawer extends StatefulWidget {


  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    margin: EdgeInsets.only(top: 30.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("https://cdn.w600.comps.canstockphoto.com/a-kitchen-chef-stock-illustrations_csp10076274.jpg"),
                      fit: BoxFit.fill),

                    ),
                  ),
                  Text('Software',
                    style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
                  Text('Software@gmail.com',
                    style: TextStyle(fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RestaurantScreen()
                    ),
                  );
                },icon: Icon(Icons.dehaze,),),
              title: Text('HOME',style: TextStyle(fontSize: 22.0,
              fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookingScreen()
                    ),
                  );
                },icon: Icon(Icons.bookmark,),),
              title: Text('Booking',style: TextStyle(fontSize: 22.0,
                  fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Test()
                    ),
                  );

                },icon: Icon(Icons.thumb_up_alt_sharp,),),
              title: Text('Thumbs UP',style: TextStyle(fontSize: 22.0,
                  fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
