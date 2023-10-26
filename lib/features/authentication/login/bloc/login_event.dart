part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ChooseLoginMethodEvents extends LoginEvent {
  final String methodWay;

  ChooseLoginMethodEvents({required this.methodWay});
}

class PhoneRequestOTP extends LoginEvent {
  final BuildContext context;
  PhoneRequestOTP(this.context);
}

class EmailRequestOTP extends LoginEvent {
  final BuildContext context;
  EmailRequestOTP(this.context);
}

class VerifyOTP extends LoginEvent {
  final BuildContext context;
  VerifyOTP(this.context);
}
