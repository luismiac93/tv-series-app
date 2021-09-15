import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/Auth/repository/auth_repository.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/header_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<AuthRepository>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          HeaderHome(
            onPress: () {
              AuthRepository.deleteToken();
              Navigator.pushReplacementNamed(context, 'welcome');
            },
          ),
        ],
      ),
    ));
  }
}
