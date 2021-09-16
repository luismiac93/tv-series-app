import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/TVSeries/repository/tv_series_repository.dart';
import 'package:tv_series_app/TVSeries/ui/widgets/card_swiper.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class SerieScreen extends StatelessWidget {
  const SerieScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tvSeriesRepository = Provider.of<TVSeriesRepository>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.chevron_left,
                    color: AppColors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Popular",
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
              ],
            ),
            const SizedBox( height: 30,),
            CardSwiper(series: tvSeriesRepository.popularSeries),
          ]),
        ),
      ),
    );
  }
}
