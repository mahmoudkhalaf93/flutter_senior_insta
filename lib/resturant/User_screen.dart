
import 'package:flutter/material.dart';
import 'package:flutter_senior/resturant/main_drawer.dart';

class UserScreen extends StatefulWidget {


  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage("https://cdn.w600.comps.canstockphoto.com/a-kitchen-chef-stock-illustrations_csp10076274.jpg"),
          ),
        ],

        title: Text('Online Food'),

      ),
      drawer: MainDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

            //reservation
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Reservation',
                      style:TextStyle(
                        fontSize: 20.0,

                      ) ,
                    ),
                    Text('!',
                      style:TextStyle(
                        fontSize: 40.0,

                      ) ,
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://cdn.w600.comps.canstockphoto.com/a-kitchen-chef-stock-illustrations_csp10076274.jpg"),
                    ),

                  ],
                ),

              ),
            ),
            //search
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.grey[200]
                ),

                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {

                      });
                    }, icon: Icon(
                      Icons.search,
                    ),),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search about your Fav Food',
                    ),
                  ],
                ),
              ),
            ),
            //type of food
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(

                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children:[
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundImage: NetworkImage("https://image.shutterstock.com/image-photo/delicious-grilled-burgers-260nw-1146199442.jpg"),
                                    ),
                                    SizedBox(
                                      height: 15.0,),
                                    Text('burger'),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0,),
                                  color: Colors.amber,

                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundImage: NetworkImage("https://www.slowfoodonthego.com/wp-content/uploads/2021/07/s2.jpg"),
                                    ),
                                    SizedBox(
                                      height: 15.0,),
                                    Text('Pizza'),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0,),
                                  color: Colors.amber,

                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundImage: NetworkImage("https://wallpapercave.com/wp/wp1842814.jpg"),
                                    ),
                                    SizedBox(
                                      height: 15.0,),
                                    Text('Dessert'),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0,),
                                  color: Colors.amber,

                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundImage: NetworkImage("https://www.wandercooks.com/wp-content/uploads/2020/10/australian-meat-party-pies-ft.jpg"),
                                    ),
                                    SizedBox(
                                      height: 15.0,),
                                    Text('Meat'),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0,),
                                  color: Colors.amber,

                                ),
                              ),
                            ),


                          ],

                        ),


                      ),
                    ),

                  ],
                ),

              ),
            ),
            //recomended
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,

                ),
                child: Row(
                  children: [
                    Text('Recommended',style:
                    TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(width: 10.0),
                    CircleAvatar(
                      radius: 10.0,
                      backgroundImage: NetworkImage("https://image.shutterstock.com/image-photo/delicious-grilled-burgers-260nw-1146199442.jpg"),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,)),

                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,

              child: Image(image: AssetImage('images/WW.jpg'),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
