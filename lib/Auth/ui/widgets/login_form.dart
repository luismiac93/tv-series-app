import 'package:flutter/material.dart';
import 'package:tv_series_app/utils/app_colors.dart';
import 'package:tv_series_app/widgets/custom_button.dart';
import 'package:tv_series_app/widgets/custom_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.nameController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20, right: 20, bottom: 30),
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: AppColors.white.withOpacity(0.9),
                  ),
                ),
              ),
              CustomField(
                placeholder: 'Name',
                textController: nameController,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomField(
                placeholder: 'Password',
                textController: passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(
                AppColors.white,
                'Log in',
                () {
                  Navigator.pushNamed(context, 'home');
                },
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
