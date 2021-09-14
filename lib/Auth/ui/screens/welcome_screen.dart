import 'package:flutter/material.dart';
import 'package:tv_series_app/Auth/ui/widgets/welcome_background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        WelcomeBackground(),
      ],
    );
  }
}
