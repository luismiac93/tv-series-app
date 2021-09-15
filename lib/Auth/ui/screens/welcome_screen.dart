import 'package:flutter/material.dart';
import 'package:tv_series_app/Auth/ui/widgets/welcome_background.dart';
import 'package:tv_series_app/Auth/ui/widgets/welcome_title.dart';
import 'package:tv_series_app/utils/app_colors.dart';
import 'package:tv_series_app/widgets/custom_button.dart';
import 'package:tv_series_app/widgets/custom_text_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WelcomeBackground(),
          const WelcomeTitle("Welcome!"),
          _buttonsScreen(context)
        ],
      ),
    );
  }

  Container _buttonsScreen(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              color: AppColors.primary, title: 'Sign up', onPress: () {}),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            color: AppColors.white,
            title: 'Log in',
            onPress: () => Navigator.pushNamed(context, 'login'),
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomTextButton("Forgot password?"),
        ],
      ),
    );
  }
}
