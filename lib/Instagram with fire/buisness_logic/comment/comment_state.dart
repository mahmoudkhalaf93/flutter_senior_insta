part of 'comment_cubit.dart';

@immutable
abstract class CommentStates {}

class CommentInitialStates extends CommentStates {}

class AddCommentSuccessStates extends CommentStates {}

class AddCommentFailureStates extends CommentStates {
  final String errorMessage;

  AddCommentFailureStates(this.errorMessage);
}

class GetCommentSuccessStates extends CommentStates {}

class GetCommentFailureStates extends CommentStates {
  final String errorMessage;

  GetCommentFailureStates(this.errorMessage);
}
