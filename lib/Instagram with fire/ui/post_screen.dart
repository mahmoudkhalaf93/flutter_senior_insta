import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/add_post/add_post_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/validators.dart';
import 'package:flutter_senior/Instagram%20with%20fire/ui/my_snack_bar.dart';

import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class PostScreen extends StatefulWidget {
  final File imageFile;

  const PostScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final TextEditingController contentController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late AddPostCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPostCubit, AddPostStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AddPostSuccessStates) {
          Navigator.pop(context);
        } else if (state is AddPostFailureStates) {
          showSnackBar(context, state.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            "New Post",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              borderRadius: BorderRadius.circular(50.sp),
              onTap: () {

              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  "Share",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                ),
              ),
            )
          ],
        ),
        body: Form(
          key: formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.sp),
                  width: 30.w,
                  child: Image.file(
                    widget.imageFile,
                    fit: BoxFit.contain,
                  )),
              Expanded(
                child: TextFormField(
                  controller: contentController,
                  validator:(value)=> isMyFormEmpty(value.toString()),
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  decoration: InputDecoration(
                      hintText: "Write a caption.",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 16.sp)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addNewPost() {
    if (formKey.currentState!.validate()) {
      cubit.addPost(
        postContent: contentController.text,
        imageFile: widget.imageFile,
      );
    }
  }
}