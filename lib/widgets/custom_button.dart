import 'package:flutter/cupertino.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPress;
  final double size;
  final double fontSize;
  final double verticalspacing;

  const CustomButton(
      {required this.color,
      required this.title,
      required this.onPress,
      this.size = 220,
      this.fontSize = 22,
      this.verticalspacing = 12});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.95,
      padding: EdgeInsets.zero,
      child: Container(
        width: size,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: fontSize,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: verticalspacing),
        decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(color: AppColors.black.withOpacity(0.6), blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onPress,
    );
  }
}
