part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginWayState extends LoginState {
  final String methodWay;

  LoginWayState({required this.methodWay});
}

class LoadingRequestOTP extends LoginState {}

class SuccessRequestOTP extends LoginState {}

class FailRequestOTP extends LoginState {}

class VerifyOTPSuccess extends LoginState {}

