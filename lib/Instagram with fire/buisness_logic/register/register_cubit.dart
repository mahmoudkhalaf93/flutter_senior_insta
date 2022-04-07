import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_senior/Instagram%20with%20fire/data/models/user.dart'
    as my_user;
import 'package:meta/meta.dart';

part 'register_state.dart';

// 1: create account (Fire Auth)
// 2: upload image (storage)
// 3: get image url (storage)
// 4: save user data (FireStore)

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());
  late String username;
  late String email;
  late String phone;
//  late String password;
  late File imageFile;
  late String imageUrl;

  void register({
    required String username,
    required String email,
    required String password,
    required String phone,
    required File imageFile,
  }) async {
    this.username = username;
    this.email = email;
    this.phone = phone;
    this.imageFile = imageFile;
    //this.password = password;
    print('hello');

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: "modyelsayd@gmail.com", password: "4d45s6a4d65as1dda")
        .then(
      (value) {
        print('XXXXXXXXXXXXXXXXXX:Register');
        uploadFile();
      },
    ).catchError((error) {
      if (error is FirebaseAuthException && error.code == 'weak-password') {
        emit(RegisterFailureStates("The password provided is too weak."));
      } else if (error is FirebaseAuthException &&
          error.code == 'email-already-in-use') {
        emit(RegisterFailureStates(
            'The account already exists for that email.'));
      } else {
        emit(RegisterFailureStates(error.toString()));
      }
    });
  }

  Future<void> uploadFile() async {
    try {
      await FirebaseStorage.instance
          .ref(
              'uploads/${DateTime.now()}${FirebaseAuth.instance.currentUser!.uid}')
          .putFile(imageFile);
      print('XXXXXXXXXXXXXXXXXX:uploadFile');
      getImageUrl();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print('upload => ${e.toString()}');
    }
  }

  Future<void> getImageUrl() async {
    try {
      imageUrl = await FirebaseStorage.instance
          .ref(
              'uploads/${DateTime.now()}${FirebaseAuth.instance.currentUser!.uid}')
          .getDownloadURL();
      print('XXXXXXXXXXXXXXXXXX:getImageUrl');
      // Within your widgets:
      // Image.network(downloadURL);
      saveUserData();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print('getImageUrl => ${e.toString()}');
    }
  }

  void saveUserData() {
    my_user.MyUser user = my_user.MyUser(
      username: username,
      phone: phone,
      profileImageUrl: imageUrl,
      email: email,
    );

    FirebaseFirestore.instance
        .collection("flutterUser")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(user.toJson())
        .then((value) {
      print('XXXXXXXXXXXXXXXXXX:saveUserData');
      emit(RegisterSuccessStates());
    }).catchError((e) {
      print('saveUserData => ${e.toString()}');
    });
  }
}
