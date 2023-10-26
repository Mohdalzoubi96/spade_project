import 'package:flutter/material.dart';

Future<T?> pushNewScreen<T extends Object?>(
  BuildContext context,
  Widget route,
) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => route,
      ),
    );

Future<T?> pushNewReplacementScreen<T extends Object?>(
    BuildContext context,
    Widget route,
    ) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => route,
      ),
    );
