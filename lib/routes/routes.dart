import 'package:flutter/widgets.dart';
import 'package:tv_series_app/Auth/ui/screens/welcome_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'welcome': (_) => const WelcomeScreen(),
};
