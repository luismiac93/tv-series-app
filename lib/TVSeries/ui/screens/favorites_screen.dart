import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/TVSeries/repository/tv_series_repository.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/vertical_series_slider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvSeriesRepository = Provider.of<TVSeriesRepository>(context);
    return Column(
      children: [
        VerticalSeriesSlider(
          series: tvSeriesRepository.favorites, 
          title: 'Favorites', onNextPage: () {},
        ),
      ],
    );
  }
}
