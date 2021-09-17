import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/TVSeries/repository/tv_series_repository.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/recent_series_slider.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/vertical_series_slider.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvSeriesRepository = Provider.of<TVSeriesRepository>(context);
    if (tvSeriesRepository.tvAiringTodaySeries.length == 0) {
      tvSeriesRepository.getTVAiringTodaySeries();
    }

    if (tvSeriesRepository.tvAiringTodaySeries.isEmpty) {
      return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)));
    }
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            RecentSeriesSlider(
              series:
                  tvSeriesRepository.tvAiringTodaySeries, // recommendations,
              title: 'Recent',
              onNextPage: () => tvSeriesRepository.getTVAiringTodaySeries(),
            ),
          ],
        ),
      ),
    );
  }
}
