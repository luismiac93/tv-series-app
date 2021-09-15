import 'package:flutter/material.dart';
import 'package:tv_series_app/Auth/ui/screens/welcome_screen.dart';
import 'package:tv_series_app/TVSeries/ui/screens/home_screen.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "One moment please...",
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primary)),
              ],
            ),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    if(true){
          Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => HomeScreen(),
              transitionDuration: Duration(milliseconds: 0)));
    }else{
                Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => WelcomeScreen(),
              transitionDuration: Duration(milliseconds: 0)));
    }
  }
}
