import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/Auth/repository/auth_repository.dart';
import 'package:tv_series_app/TVSeries/repository/tv_series_repository.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/header_home.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/series_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepository = Provider.of<AuthRepository>(context);
    final tvSeriesRepository = Provider.of<TVSeriesRepository>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderHome(
              onPress: () {
                AuthRepository.deleteToken();
                Navigator.pushReplacementNamed(context, 'welcome');
              },
            ),
            // Slider popular series
            SeriesSlider(
              series: tvSeriesRepository.popularSeries, // populares,
              title: 'Popular', // opcional
              onNextPage: () => tvSeriesRepository.getPopularSeries(),
            ),
          ],
        ),
      ),
    ));
  }
}
