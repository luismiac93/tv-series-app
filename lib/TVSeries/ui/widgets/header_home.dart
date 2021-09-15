import 'package:flutter/material.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class HeaderHome extends StatelessWidget {
  final VoidCallback onPress;
  const HeaderHome({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(
          "Home",
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
        IconButton(
          onPressed: onPress,
          icon: const Icon(Icons.logout),
          color: AppColors.gray,
        ),
      ],
    );
  }
}
