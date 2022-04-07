part of 'login_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {}

class LoginFailureStates extends LoginStates {
  final String errorMessage;

  LoginFailureStates(this.errorMessage);
}
