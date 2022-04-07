import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/news/bloc/news_cubit.dart';
import 'package:flutter_senior/news/components/news_components.dart';
import 'package:flutter_senior/news/models/news_response.dart';

class BusinessNewsScreen extends StatelessWidget {


NewsCubit? cubit;

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit,NewsStates>(builder:(context, state) {
     cubit =NewsCubit.get(context);
     return Scaffold(
       body: newsBody(cubit!.businessarticles, cubit!.imageUrl),
     );

   },
     listener: (context, state) {

   },
   );
  }
}

