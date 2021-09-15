import 'package:flutter/material.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class CustomField extends StatelessWidget {
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomField(
      {Key? key,
      required this.placeholder,
      required this.textController,
      this.keyboardType = TextInputType.name,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: TextStyle(
          color: AppColors.gray,
          fontSize: 20,
        ),
        controller: textController,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.gray,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.gray,
            ),
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 20,
            color: AppColors.gray,
          ),
        ),
      ),
    );
  }
}
