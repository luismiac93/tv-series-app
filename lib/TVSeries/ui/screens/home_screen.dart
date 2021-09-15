import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/Auth/repository/auth_repository.dart';
import 'package:tv_series_app/TVSeries/repository/tv_series_repository.dart';
import 'package:tv_series_app/TVSeries/repository/ui_repository.dart';
import 'package:tv_series_app/TVSeries/ui/screens/favorites_screen.dart';
import 'package:tv_series_app/TVSeries/ui/screens/recent_screen.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/custom_bottom_navigation_bar.dart';
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
        child: _HomeSlides(
          tvSeriesRepository: tvSeriesRepository,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

// _HomePageSlide(tvSeriesRepository: tvSeriesRepository)
class _HomeSlide extends StatelessWidget {
  const _HomeSlide({
    Key? key,
    required this.tvSeriesRepository,
  }) : super(key: key);

  final TVSeriesRepository tvSeriesRepository;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class _HomeSlides extends StatelessWidget {
  final TVSeriesRepository tvSeriesRepository;

  const _HomeSlides({Key? key, required this.tvSeriesRepository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final uiRepository = Provider.of<UIRepository>(context);
    final currentIndex = uiRepository.itemSelected;

    switch (currentIndex) {
      case 0:
        return _HomeSlide(
          tvSeriesRepository: tvSeriesRepository,
        );
      case 1:
        return FavoritesScreen();
      case 2:
        return RecentScreen();
      default:
        return _HomeSlide(
          tvSeriesRepository: tvSeriesRepository,
        );
    }
  }
}
