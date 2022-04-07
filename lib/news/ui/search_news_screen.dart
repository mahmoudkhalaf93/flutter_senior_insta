import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior/news/components/news_components.dart';
import 'package:flutter_senior/news/models/news_response.dart';

import '../../components.dart';

class SearchNewsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchNewsScreen> {
  var searchController = TextEditingController();
  String imageUrl = "https://skillz4kidzmartialarts.com/wp-content/uploads/2017/04/default-image.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              myTextFormField(
                textInputAction: TextInputAction.search,
                controller: searchController,
                validator: (value) {
                  if (value!.isEmpty) return "Write search key";
                  return null;
                },
                label: "Search",
                prefixIcon: Icons.search,
                onFieldSubmitted: (value) {
                  if (value.isEmpty) {
                    print("Write search key");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Write search key", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),)));
                    return;
                  }

                  search(value);
                },


              ),
              Visibility(
                visible: isSearching,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
              Expanded(child: searchBody(searchArticles, imageUrl))
            ],
          ),
        ),
      ),
    );
  }

  bool isSearching = false;
  List<Articles> searchArticles = [];

  void search(String value) async {
    // https://newsapi.org/v2/everything?q=tesla&from=2021-11-21&sortBy=publishedAt&apiKey=fa72aea7f1af46a6a45be8aa23e21b64

    setState(() {
      isSearching = true;
    });

    try {
      var response = await Dio().get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          "q": "$value",
          "from": "2022-1-25",
          "sortBy": "publishedAt",
          "apiKey": "0b6e378b6dff481fb3742f6f50905668",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      searchArticles = news.articles!;
      setState(() {
        isSearching = false;
      });

    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print('catched');
        print(e.response!.data['message']);
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        print('check your connection');
        return;
      }

      if (e.type == DioErrorType.receiveTimeout) {
        print('unable to connect to the server');
        return;
      }

      if (e.type == DioErrorType.other) {
        print('Something went wrong');
        return;
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

}