import 'package:flutter/widgets.dart';

import '../../features/feature.export.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "/home": (_) => const HomeScreen(),
  "/splash": (_) => const SplashScreen(),

};
