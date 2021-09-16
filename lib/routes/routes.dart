import 'package:flutter/widgets.dart';
import 'package:tv_series_app/Auth/ui/screens/login_screen.dart';
import 'package:tv_series_app/Auth/ui/screens/splash_screen.dart';
import 'package:tv_series_app/Auth/ui/screens/welcome_screen.dart';
import 'package:tv_series_app/TVSeries/ui/screens/details_screen.dart';
import 'package:tv_series_app/TVSeries/ui/screens/home_screen.dart';
import 'package:tv_series_app/TVSeries/ui/screens/serie_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'welcome': (_) => const WelcomeScreen(),
  'login': (_) => const LoginScreen(),
  'home': (_) => const HomeScreen(),
  'splash': (_) => const SplashScreen(),
  'serie': (_) => const SerieScreen(),
  'details': (_) => const DetailsScreen(),
};
