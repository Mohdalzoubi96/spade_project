
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spade_project/utils/services/custom_navigation.dart';
import '../../../utils/services/routes.dart';
import '../../../utils/utils.export.dart';
import '../../authentication/auth.export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      _navigateToLoginScreen();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset(AppAssets.spadeLogo),
      ),
    );
  }

  void _navigateToLoginScreen(){
    CustomNavigator.push(Routes.LOGIN_SCREEN);
    // pushNewScreen(context, const LoginScreen());
  }
}
