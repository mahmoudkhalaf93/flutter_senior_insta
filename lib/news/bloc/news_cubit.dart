

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/news/models/news_response.dart';
import 'package:flutter_senior/news/ui/business_news_screen.dart';
import 'package:flutter_senior/news/ui/science_news_screen.dart';
import 'package:flutter_senior/news/ui/sports_news_screen.dart';

import '../ui/technology_news_screen.dart';

class NewsStates{}

class InitNewsStates extends NewsStates{}

class GetNewsStates extends NewsStates{}

class ChangeNewsNavigationStates extends NewsStates{}


class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(initialState) : super(initialState);

  static NewsCubit get(context) =>BlocProvider.of(context);

  int index = 0;
  List<String> categories = ["Business", "Sports", "Technology", "Science"];
  List<Widget> screens = [
    BusinessNewsScreen(),
    SportsNewsScreen(),
    TechnologyNewsScreen(),
    ScienceNewsScreen(),
  ];

  void ChangeNavigationIndex(index){
    this.index = index;
    emit(ChangeNewsNavigationStates());
}



  List<Articles> businessarticles=[];
  String imageUrl = "https://skillz4kidzmartialarts.com/wp-content/uploads/2017/04/default-image.jpg";
  void getBusinessNews() async {
    try {

      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country":"eg",
          "category": "business",
          "apiKey":"0b6e378b6dff481fb3742f6f50905668",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      businessarticles = news.articles!;
      //setState(() {});
        emit(GetNewsStates());
      print(response);

    } catch (e) {
      print(e);
    }
  }

  List<Articles> sportsarticles=[];
  void getSportsNews() async {
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
      sportsarticles = news.articles!;
      //setState(() {});
      emit(GetNewsStates());

      print(response);

    } catch (e) {
      print(e);
    }
  }

  List<Articles> technologyarticles=[];
  void getTechnologyNews() async {
    try {

      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country":"eg",
          "category": "Technology",
          "apiKey":"0b6e378b6dff481fb3742f6f50905668",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      technologyarticles = news.articles!;
      //setState(() {});
      emit(GetNewsStates());

      print(response);

    } catch (e) {
      print(e);
    }
  }

  List<Articles> sciencearticles=[];
  void getScienceNews() async {
    try {

      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country":"eg",
          "category": "science",
          "apiKey":"0b6e378b6dff481fb3742f6f50905668",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      sciencearticles = news.articles!;
      //setState(() {});
      emit(GetNewsStates());

      print(response);

    } catch (e) {
      print(e);
    }
  }




}
