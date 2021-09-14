import 'package:flutter/material.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class WelcomeTitle extends StatelessWidget {
  final String title;
  const WelcomeTitle(this.title);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.10,
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
