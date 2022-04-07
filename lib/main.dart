import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/add_post/add_post_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/comment/comment_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/login/login_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/posts/posts_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/register/register_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/data/local/my_shared.dart';
import 'package:flutter_senior/Instagram%20with%20fire/ui/login_screen.dart';
import 'package:flutter_senior/Instagram%20with%20fire/ui/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  await Firebase.initializeApp();

  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider(
            create: (context) => LoginCubit(),
          ),
        BlocProvider(
            create: (context) => RegisterCubit()),
        BlocProvider(
            create: (context) => AddPostCubit()),
        BlocProvider(
            create: (context) => PostsCubit()),
        BlocProvider(
             create: (context) => CommentCubit()),
        ],
        child: MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            focusColor: Colors.black,
            textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            primarySwatch: Colors.blue,
          ),
          home: ResponsiveSizer(
            builder: (p0, p1, p2) => LoginScreen(),
          ),
        ));
  }
}