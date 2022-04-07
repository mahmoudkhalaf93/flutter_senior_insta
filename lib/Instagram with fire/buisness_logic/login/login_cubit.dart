import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_senior/Instagram%20with%20fire/data/local/my_shared.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import '../../data/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  void login(
      {required String email,
        required String password,
      }) async{

    try {
      UserCredential userCredential //ممكن اوقفه عادي
      = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      getUserData();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(LoginFailureStates('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(LoginFailureStates('Wrong password provided for that user.'));
      }
    } catch(error){

      emit(LoginFailureStates(error.toString()));
    }
  }

  void getUserData() {
    FirebaseFirestore.instance
        .collection("flutterUser")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
          (value) {
            print('dididid');
        if(value.data() == null) return;

        var user = MyUser.fromJson(value.data());

        saveUserData(user);
      },
    );
  }
  void saveUserData(MyUser user) {
    MyShared.putString(key: "user", value: jsonEncode(user));

    MyShared.putString(key: "username", value: user.username);
    MyShared.putString(key: "profileImageUrl", value: user.profileImageUrl);

    emit(LoginSuccessStates());
  }

  emailValidator(String value) {

    if (value.isEmpty){
      return "Email required";
    }
    bool emailValid = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
    if (!emailValid) {
      return "email not valid";
    }
    return null;
  }

  passwordValidator(String value) {
    if (value.isEmpty){
      return "password required";
    }
    if (value.length < 6){
      return "password must be at least 6 characters";
    }

    return null;
  }
}



