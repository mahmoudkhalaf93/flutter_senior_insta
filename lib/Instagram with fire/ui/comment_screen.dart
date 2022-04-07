import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/comment/comment_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/data/local/my_shared.dart';
import 'package:flutter_senior/Instagram%20with%20fire/data/models/comment.dart';
import 'package:flutter_senior/Instagram%20with%20fire/ui/my_snack_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentsScreen extends StatefulWidget {
   final String postId;

   const CommentsScreen( {Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {

  late CommentCubit cubit;

  final TextEditingController commentController = TextEditingController();


  @override
  void initState() {

    super.initState();

    cubit = BlocProvider.of<CommentCubit>(context);
    cubit.comments.clear();
    cubit.getComments(postId: widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentCubit, CommentStates>(
  listener: (context, state) {
      if (state is AddCommentSuccessStates){
        commentController.clear();
        cubit.getComments(postId: widget.postId);
      } else if(state is AddCommentFailureStates ){
        showSnackBar(context, state.errorMessage);
      }
  },
  child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Comments",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: buildCommentListView(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage( MyShared.getString(key: "profileImageUrl")),
                  radius: 22.sp,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                    child: TextFormField(
                      controller: commentController,
                      onFieldSubmitted:(value) => cubit.addNewComment(comment: value, postId: widget.postId) ,
                      textInputAction: TextInputAction.send,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        hintText: "Add a comment",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0.sp),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0.sp),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2.0.sp,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          space()
        ],
      ),
    ),
);
  }

  space() {
    if (Platform.isIOS) {
      return SizedBox(
        height: 19.sp,
      );
    }
    else{
      return const SizedBox(height: 0,);
    }
  }

  Widget buildCommentListView() {
   return BlocBuilder<CommentCubit, CommentStates>(
   buildWhen: (previous, current) => current is GetCommentSuccessStates,
   builder: (context, state) {
    return ListView.builder(
      itemCount: cubit.comments.length,
      itemBuilder: (context, index) {
        Comment comment =cubit.comments[index];
        return Padding(
          padding: EdgeInsets.all(15.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage( comment.userImageUrl.toString()),
                radius: 18.sp,
              ),
              SizedBox(
                width: 10.sp,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text:  TextSpan(children: [
                            TextSpan(
                                text: comment.username,
                                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
                            TextSpan(
                                text:
                                '  ${comment.comment}')
                          ])),
                      Text(
                        comment.commentTime,
                        style:
                        TextStyle(fontSize: 15.sp, color: Colors.grey),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ))
            ],
          ),
        );
      },
    );
  },
);
  }
}