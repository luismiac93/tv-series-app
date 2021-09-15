import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/Auth/repository/auth_repository.dart';
import 'package:tv_series_app/routes/routes.dart';
import 'package:tv_series_app/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthRepository(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TV Series App',
        initialRoute: 'splash',
        theme: themeApp,
        routes: appRoutes,
      ),
    );
  }
}
