part of 'posts_cubit.dart';

@immutable
abstract class PostsStates {}

class PostsInitialStates extends PostsStates {}

class PostsGetSuccessStates extends PostsStates {}

class PostsGetFailureStates extends PostsStates {}

class LikePostSuccessStates extends PostsStates {}

class LikePostFailureStates extends PostsStates {
  final String errorMessage;

  LikePostFailureStates(this.errorMessage);
}

class UnLikePostSuccessStates extends PostsStates {}

class UnLikePostFailureStates extends PostsStates {
  final String errorMessage;

  UnLikePostFailureStates(this.errorMessage);
}