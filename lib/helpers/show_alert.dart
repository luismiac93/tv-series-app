import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tv_series_app/utils/app_colors.dart';
import 'package:tv_series_app/widgets/custom_button.dart';

showAlert(BuildContext context, String title, String subtitle) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.black,
        title: Text(
          title,
          style: TextStyle(color: AppColors.gray),
        ),
        content: Text(
          subtitle,
          style: TextStyle(color: AppColors.gray),
        ),
        actions: [
          CustomButton(
            color: AppColors.primary,
            title: "Ok",
            onPress: () => Navigator.pop(context),
            size: 90,
            fontSize: 16,
            verticalspacing: 6,
          ),
        ],
      ),
    );
  }

  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text("Ok"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
