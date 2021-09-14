import 'package:flutter/cupertino.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  const CustomTextButton(this.title);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.95,
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
