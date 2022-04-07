part of 'register_cubit.dart';

@immutable
abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}


class RegisterSuccessStates extends RegisterStates {}

class RegisterFailureStates extends RegisterStates {
  final String errorMessage;

  RegisterFailureStates(this.errorMessage);
}
