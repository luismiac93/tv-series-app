import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tv_series_app/routes/routes.dart';
import 'package:tv_series_app/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV Series App',
      initialRoute: 'welcome',
      theme: themeApp,
      routes: appRoutes,
    );
  }
}
