import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/utils.export.dart';
import '../../auth.export.dart';

part 'login_event.dart';

part 'login_state.dart';

enum AuthType { byPhone, byEmail }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController loginController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  AuthType authType = AuthType.byPhone;

  LoginBloc() : super(LoginWayState(methodWay: 'init')) {
    on<LoginEvent>((event, emit) async {
      if (event is ChooseLoginMethodEvents) {
        emit(LoginWayState(methodWay: event.methodWay));
      }

      if (event is PhoneRequestOTP) {
        try {
          authType = AuthType.byPhone;
          emit(LoadingRequestOTP());
          final body = {
            'phone': loginController.text,
          };
          final res =
              await RestApiService.post(ApiPaths.loginPhone, json.encode(body));

          if (res.statusCode == 200 || res.statusCode == 201) {
            emit(LoginWayState(methodWay: 'init'));
            event.context.read<ScreenHandleCubit>().emitSuccess();
          } else {
            loginController.text = '';
            emit(LoginWayState(methodWay: 'init'));
          }
        } catch (e) {
          emit(LoginWayState(methodWay: 'init'));
        }
      }

      if (event is EmailRequestOTP) {
        try {
          authType = AuthType.byEmail;
          emit(LoadingRequestOTP());
          final body = {
            'email': loginController.text,
          };

          final res =
              await RestApiService.post(ApiPaths.loginEmail, json.encode(body));

          if (res.statusCode == 200 || res.statusCode == 201) {
            emit(LoginWayState(methodWay: 'init'));
            event.context.read<ScreenHandleCubit>().emitSuccess();
          } else {
            loginController.text = '';
            emit(LoginWayState(methodWay: 'init'));
          }
        } catch (e) {
          emit(LoginWayState(methodWay: 'init'));
        }
      }

      if (event is VerifyOTP) {
        try {
          switch (authType) {
            case AuthType.byEmail:
              return _byEmailVerify(emit, event.context);
            case AuthType.byPhone:
              return _byPhoneVerify(emit, event.context);
          }
        } catch (e) {
          emit(LoginWayState(methodWay: 'init'));
        }
      }
    });
  }

  Future<void> _byPhoneVerify(
      Emitter<LoginState> emit, BuildContext context) async {
    emit(LoadingRequestOTP());
    final body = {
      'phone': loginController.text,
      'otp': otpController.text,
    };
    final res =
        await RestApiService.post(ApiPaths.verifyPhone, json.encode(body));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print('hhhhh ${res.headers['set-cookie']}');
      context.read<SocketBloc>().add(InitSocketConnection(res.headers['set-cookie'] ?? ''));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("global_cookies", res.headers['set-cookie']??"no save");
      emit(VerifyOTPSuccess());
    } else {

      print('jbdfb  ${res.body}${res.statusCode}');
      loginController.text = '';
      otpController.text = '';
      emit(LoginWayState(methodWay: 'init'));
      context.read<ScreenHandleCubit>().emitLoading();
    }
  }

  Future<void> _byEmailVerify(
      Emitter<LoginState> emit, BuildContext context) async {
    emit(LoadingRequestOTP());
    final body = {
      'email': loginController.text,
      'otp': otpController.text,
    };
    final res =
        await RestApiService.post(ApiPaths.verifyEmail, json.encode(body));

    if (res.statusCode == 200 || res.statusCode == 201) {
      context.read<SocketBloc>().add(InitSocketConnection(res.headers['set-cookie'] ?? ''));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("global_cookies", res.headers['set-cookie']??"no save");
      emit(VerifyOTPSuccess());
    } else {
      print('jbdfb  ${res.body}${res.statusCode}');
      loginController.text = '';
      otpController.text = '';
      emit(LoginWayState(methodWay: 'init'));
      context.read<ScreenHandleCubit>().emitLoading();
    }
  }
}
