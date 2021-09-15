import 'package:flutter/material.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)),
          ],
        ),
      ),
    );
  }
}
