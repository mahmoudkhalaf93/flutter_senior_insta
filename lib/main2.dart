import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/Instagram%20with%20fire/ui/homee_screen.dart';
import 'package:flutter_senior/basics/builder%20list.dart';
import 'package:flutter_senior/basics/forget_password.dart';
import 'package:flutter_senior/basics/home.dart';
import 'package:flutter_senior/basics/listview.dart';
import 'package:flutter_senior/basics/login.dart';
import 'package:flutter_senior/basics/persons_screen.dart';
import 'package:flutter_senior/basics/sec11.dart';
import 'package:flutter_senior/basics/second_screen.dart';
import 'package:flutter_senior/basics/sign_up.dart';
import 'package:flutter_senior/basics/stack_Screen.dart';
import 'package:flutter_senior/bloc/bloc_home.dart';
import 'package:flutter_senior/news/bloc/app_cubit.dart';
import 'package:flutter_senior/news/bloc/news_cubit.dart';
import 'package:flutter_senior/news/ui/mid_news_screen.dart';
import 'package:flutter_senior/news/simple_news_screen.dart';
import 'package:flutter_senior/posts/posts_screen.dart';
import 'package:flutter_senior/resturant/User_screen.dart';
import 'package:flutter_senior/resturant/rate_bar.dart';
import 'package:flutter_senior/resturant/resturant_screen.dart';
import 'package:flutter_senior/shop_app/login/shop_login_screen.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(DevicePreview(
      enabled: true,
      builder:(context)=>MyApp()
  )
  );
}
//constructor
//build
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(InitAppStates())..getThemeMode()),
        BlocProvider(
          create: (context)=> NewsCubit(InitNewsStates())
            ..getBusinessNews()
            ..getSportsNews()
            ..getTechnologyNews()
            ..getScienceNews(),
        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeeScreen(),


          );
        },
        listener: (context, state) {},
      ),
    );

  }

  ThemeData LightTheme(){
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
      primarySwatch: Colors.amber,
      appBarTheme: AppBarTheme(
        color: Colors.amber,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.amber,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),

    );
  }

  ThemeData DarkTheme(){
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),

      scaffoldBackgroundColor:Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,

        ),
      ),

    );
  }


}