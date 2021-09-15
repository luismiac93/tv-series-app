import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/Auth/repository/auth_repository.dart';
import 'package:tv_series_app/Auth/ui/widgets/login_form.dart';
import 'package:tv_series_app/Auth/ui/widgets/welcome_background.dart';
import 'package:tv_series_app/Auth/ui/widgets/welcome_title.dart';
import 'package:tv_series_app/helpers/show_alert.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<AuthRepository>(context);
    final nameController = new TextEditingController();
    final passwordController = new TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          const WelcomeBackground(),
          const WelcomeTitle("Login"),
          LoginForm(
            nameController: nameController,
            passwordController: passwordController,
            onPress: () async {
              FocusScope.of(context).unfocus();
              final loginOk = await authRepository.login(
                  nameController.text, passwordController.text);
              if (loginOk) {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'home', (route) => false);
              } else {
                showAlert(context, "Login", "Incorrect email or password");
              }
            },
          )
        ],
      ),
    );
  }
}
