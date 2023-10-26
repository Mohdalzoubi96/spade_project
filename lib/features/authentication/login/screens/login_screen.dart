import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:spade_project/features/feature.export.dart';
import 'package:spade_project/utils/services/custom_navigation.dart';

import '../../../../utils/services/routes.dart';
import '../../../../utils/utils.export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../auth.export.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppAssets.spadeLogo),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
              decoration: BoxDecoration(
                color: LightTheme.of(context).secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CustomRadioButton(
                      defaultSelected: AppLocalizations.of(context)!.by_phone,
                      width: 44.w,
                      elevation: 2,
                      absoluteZeroSpacing: true,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: [
                        AppLocalizations.of(context)!.by_phone,
                        AppLocalizations.of(context)!.by_email,
                      ],
                      buttonValues: [
                        AppLocalizations.of(context)!.by_phone,
                        AppLocalizations.of(context)!.by_email,
                      ],
                      buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      radioButtonValue: (value) {
                        loginBloc.loginController.text = '';
                        loginBloc.otpController.text = '';
                        FocusScope.of(context).unfocus();
                        loginBloc.authType =
                            value == AppLocalizations.of(context)!.by_email
                                ? AuthType.byEmail
                                : AuthType.byPhone;
                        context
                            .read<LoginBloc>()
                            .add(ChooseLoginMethodEvents(methodWay: value));
                      },
                      selectedColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                      if (state is VerifyOTPSuccess) {
                        CustomNavigator.push(Routes.HOME_SCREEN);
                      }
                    }, builder: (context, state) {
                      if (state is LoginWayState) {
                        if (state.methodWay ==
                            AppLocalizations.of(context)!.by_email) {
                          return TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                hintText:
                                    AppLocalizations.of(context)!.by_email),
                            controller: loginBloc.loginController,
                            keyboardType: TextInputType.emailAddress,
                          );
                        } else {
                          return TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                hintText:
                                    AppLocalizations.of(context)!.by_phone),
                            controller: loginBloc.loginController,
                            keyboardType: TextInputType.phone,
                          );
                        }
                      } else if (state is LoadingRequestOTP) {
                        return const CircularProgressIndicator();
                      }

                      return const SizedBox.shrink();
                    }),
                  ),
                  BlocBuilder<ScreenHandleCubit, ScreenHandleState>(
                      builder: (context, state) {
                    if (state is ScreenHandleSuccess) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              AppLocalizations.of(context)!.otp,
                              style: TextStyle(
                                fontSize: 25.sp,
                              ),
                            ),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.otp,
                            ),
                            controller: loginBloc.otpController,
                            keyboardType: TextInputType.phone,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 10),
                            child: SizedBox(
                              width: 60.w,
                              height: 6.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  loginBloc.add(VerifyOTP(context));
                                },
                                child: Text(
                                    AppLocalizations.of(context)!.verify_otp),
                              ),
                            ),
                          )
                        ],
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 10),
                      child: SizedBox(
                        width: 60.w,
                        height: 6.h,
                        child: ElevatedButton(
                          onPressed: () {
                            loginBloc.authType == AuthType.byPhone
                                ? loginBloc.add(PhoneRequestOTP(context))
                                : loginBloc.add(EmailRequestOTP(context));
                          },
                          child:
                              Text(AppLocalizations.of(context)!.request_otp),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
