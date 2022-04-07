import 'package:flutter/material.dart';

class MessengerTask extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 8.0,
              ),
              CircleAvatar(
                child: Text('5',style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                backgroundColor: Colors.red,
                radius: 7.0,
              ),
            ],
          ),

        ),
        actions: [CircleAvatar(
            child: Icon(
              Icons.camera_alt,

              color: Colors.black,
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            child: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey[300],


          ),
        ],
      ),
    ),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              Container(
                height: 40.0,
                color: Colors.blue,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      'All Notifications off until 1:00 pm',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                    SizedBox(
                      width: 120.0,
                    ),
                    Text(
                      'Turn On',
                    style:TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ],
                ),

              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding:const EdgeInsets.all(8.0) ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300]
                  ),

                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Search',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FloatingActionButton(onPressed: () {},

                      mini: true,
                      child:
                      const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    const SizedBox(
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

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage("https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"),
                    ),
                    const SizedBox(
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
                      width: 150.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 10.0,
                    ),

                  ],

                ),
              ),















            ],
          ),
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble,color: Colors.blue,),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.people,color: Colors.grey,),
    label: 'People',
    ),

        ],
      ) ,




    );
  }
}
