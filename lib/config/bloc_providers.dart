import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_project/features/home_screen/bloc/home_bloc.dart';

import '../features/authentication/auth.export.dart';
import '../features/authentication/login/bloc/login_bloc.dart';
import '../utils/utils.export.dart';

MultiBlocProvider listOfBlocProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<SocketBloc>(
        create: (_) => SocketBloc(),
      ),

      BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(),
      ),

      BlocProvider<ScreenHandleCubit>(
        create: (_) => ScreenHandleCubit(),
      ),
      BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(),
      ),
    ],
    child: child,
  );
}
