import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_palette/flutter_palette.dart';
import 'package:sizer/sizer.dart';

class LightTheme {
  final BuildContext context;

  LightTheme(this.context);

  LightTheme.of(this.context);

  final colorPalette = ColorPalette.from(<Color>[
    const Color(0xffeb7b15),
    const Color(0xffedf1f8),
  ]);

  List<Color> get themeColors => colorPalette.toColors();

  Color get primaryColor => themeColors[0];

  Color get darkBlueColor => primaryColor;

  Color get secondaryColor => themeColors[1];

  Color get grayColor => secondaryColor;

  TextStyle get whiteBoldHeadline6Text =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.secondaryContainer,
            fontWeight: FontWeight.bold,
          );

  TextStyle get blackBoldHeadline6Text =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          );

  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: grayColor,
        primaryColor: primaryColor,
        brightness: Brightness.light,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: primaryColor, //change your color here
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
            ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 13.0.sp),
            ),
          ),
        ),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
              bodyLarge: ThemeData.light()
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 13.0.sp),
              displayMedium: ThemeData.light()
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              displaySmall: ThemeData.light()
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              headlineMedium: ThemeData.light()
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              headlineSmall: ThemeData.light()
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
              titleLarge: ThemeData.light()
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            )
            .apply(
                bodyColor: primaryColor,
                displayColor: primaryColor,
                fontFamily: "Metropolis" // actual application font
                ),
      );
}
