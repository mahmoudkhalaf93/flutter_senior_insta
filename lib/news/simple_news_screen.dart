import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior/news/models/news_response.dart';

class SimpleNewsSreen extends StatefulWidget {
  const SimpleNewsSreen({Key? key}) : super(key: key);

  @override
  State<SimpleNewsSreen> createState() => _SimpleNewsSreenState();
}

class _SimpleNewsSreenState extends State<SimpleNewsSreen> {

  List<Articles> articles=[];
  String _imageUrl = "https://skillz4kidzmartialarts.com/wp-content/uploads/2017/04/default-image.jpg";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  void getNews() async {
    try {

      var response = await Dio().get(
          'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country":"eg",
          "category": "sports",
          "apiKey":"0b6e378b6dff481fb3742f6f50905668",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      articles = news.articles!;
      setState(() {});

      print(response);

    } catch (e) {
      print(e);
    }
  }

  getNeews() {
    Dio()
        .get('https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=0b6e378b6dff481fb3742f6f50905668')
        .then((value) {
      NewsResponse response = NewsResponse.fromJson(value.data);
      articles = response.articles!;

      setState(() {});
    }).catchError((error) {
      print('ERROR => $error');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple News'
        ),
      ),
      body:  articles.isEmpty ? Center(
        child: CircularProgressIndicator.adaptive(),
      )
          :  ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]),
            child: Column(
              children: [
                Image.network(articles[index].urlToImage ?? _imageUrl ),
                SizedBox(
                  height: 10,
                ),
                Text( articles[index].title!,
                  textAlign: TextAlign.center,),
              ],
            ),
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}

