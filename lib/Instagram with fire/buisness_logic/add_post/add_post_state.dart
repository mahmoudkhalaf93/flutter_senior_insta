part of 'add_post_cubit.dart';

@immutable
abstract class AddPostStates {}

class AddPostInitialStates extends AddPostStates {}

class AddPostSuccessStates extends AddPostStates {}

class AddPostFailureStates extends AddPostStates {
  final String errorMessage;

  AddPostFailureStates(this.errorMessage);
}