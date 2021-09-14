import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  const WelcomeBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: -265,
      left: -300,
      right: -280,
      child: Image(
        image: AssetImage(
          "assets/images/welcome_image.jpg",
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}