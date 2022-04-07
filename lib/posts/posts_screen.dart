import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  List<dynamic> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
  }

  void getPosts() async {
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

      posts = response.data;
      setState(() {});

      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]),
            child: Column(
              children: [
                Text(posts[index]['title'], textAlign: TextAlign.start),
                SizedBox(
                  height: 10,
                ),
                Text(posts[index]['body'],textAlign: TextAlign.center,),
              ],
            ),
          );
        },
        itemCount: posts.length,
      ),
    );
  }
}

