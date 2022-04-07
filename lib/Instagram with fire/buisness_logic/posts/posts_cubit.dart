import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/models/post.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostsInitialStates());

  List<Post> posts = [];

  void getPosts() {
    print('Posts => ${posts.length}');

    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      posts.clear();

      for (var doc in querySnapshot.docs) {

        Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

        Post post = Post.fromJson(json);

        var likes = await FirebaseFirestore.instance
            .collection("posts")
            .doc(post.postId)
            .collection("likes")
            .get();

        post.likesCount = likes.docs.length;

        for (var element in likes.docs) {
          if (element.data()["userId"] ==
              FirebaseAuth.instance.currentUser!.uid) {
            post.isLiked = true;
          }
          else{
            post.isLiked = false;
          }
        }

        posts.add(post);
      }

      emit(PostsGetSuccessStates());
      print('Posts => ${posts.length}');
    });
  }

  void likePost(String postId ) {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("likes")
        .doc(userId)
        .set({"userId": userId})
        .then((value) =>emit(LikePostSuccessStates()) )
        .catchError((error)=> emit(LikePostFailureStates(error.toString())));




  }

  void UnlikePost( String postId) {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("likes")
        .doc(userId)
        .delete()
        .then((value) =>emit(UnLikePostSuccessStates()) )
        .catchError((error)=> emit(UnLikePostFailureStates(error.toString())));




  }


}
