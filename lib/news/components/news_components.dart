import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior/news/models/news_response.dart';
import 'package:flutter_senior/news/ui/news_web_view_screen.dart';

Widget newsBody(List<Articles> articles , String imageUrl ){
  return Scaffold(
    body:  articles.isEmpty ? Center(
      child: CircularProgressIndicator.adaptive(),
    )
        :  ListView.builder(

      itemBuilder: (context, index) {
        bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewsWebViewScreen(articles[index].url),
            ));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDarkMode ? Colors.black : Colors.grey[300]),
            child: Column(
              children: [
                Image.network(articles[index].urlToImage ?? imageUrl ),
                SizedBox(
                  height: 10,
                ),
                Text( articles[index].title!,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,),
              ],
            ),
          ),
        );
      },
      itemCount: articles.length,
    ),
  );
}


Widget searchBody(List<Articles> articles, String imageUrl) {
  return ListView.builder(
    itemBuilder: (context, index) => InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsWebViewScreen(articles[index].url),
        ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300]),
        child: Column(
          children: [
            Image.network(articles[index].urlToImage ?? imageUrl),
            SizedBox(
              height: 10,
            ),
            Text(
              articles[index].title!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
    itemCount: articles.length,
  );
}