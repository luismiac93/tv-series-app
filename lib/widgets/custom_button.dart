import 'package:flutter/cupertino.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPress;

  const CustomButton(this.color, this.title, this.onPress);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.95,
      padding: EdgeInsets.zero,
      child: Container(
        width: 220,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 22,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: color,
            boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.6), blurRadius: 5)],
            borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onPress,
    );
  }
}
