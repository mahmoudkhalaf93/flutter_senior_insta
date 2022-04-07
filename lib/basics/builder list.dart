import 'package:flutter/material.dart';

class ListBuilder extends StatefulWidget {
  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
int selectedIndex =-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),

    body: ListView.builder(
      itemBuilder: (context, index){
        return InkWell(
          onTap: () {
            print(index);
            selectedIndex =index;
            setState(() {

            });

          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color:(index == selectedIndex) ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(10,),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    radius: 20.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Your Story',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0

                        ),
                      ),
                      Text(
                        'Add to your Story',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,

                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 10.0,
                  ),

                ],
              ),
            ),
          ),
        );
    },
      itemCount: 1000,
    ),
    );
  }
}
