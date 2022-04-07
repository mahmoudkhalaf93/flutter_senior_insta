import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStates{}

class InitAppStates extends AppStates{}

class AppThemeChangeState  extends AppStates{}

class AppCubit extends Cubit<AppStates> {
  AppCubit(AppStates initialState) : super(initialState);

  static AppCubit get(context) => BlocProvider.of(context);

  ThemeMode themeMode = ThemeMode.light;


  void changeThemeMode() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();

  if (themeMode == ThemeMode.light) {
  themeMode = ThemeMode.dark;
  preferences.setString("themeMode", "dark");

  } else {
  themeMode = ThemeMode.light;
  preferences.setString("themeMode", "light");
  }
  emit(AppThemeChangeState());
}

void getThemeMode() async{

    SharedPreferences preferences =await SharedPreferences.getInstance();



    String? theme =preferences.getString("themeMode") ?? "light";

    if (theme == "light") {
      ThemeMode themeMode = ThemeMode.light;
    }
    else{
      ThemeMode themeMode = ThemeMode.dark;


    }
    emit(AppThemeChangeState());
}


}
