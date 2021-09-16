import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:tv_series_app/TVSeries/models/series_response.dart';
import 'package:tv_series_app/utils/app_colors.dart';
import 'package:tv_series_app/widgets/custom_button.dart';

class CardSwiper extends StatefulWidget {
  final List<Series> series;

  const CardSwiper({Key? key, required this.series}) : super(key: key);

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.widget.series.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.78,
      child: Swiper(
        onIndexChanged: (index) {
          selected = index;
          setState(() {});
        },
        itemCount: widget.series.length,
        viewportFraction: 0.68,
        scale: 0.6,
        itemBuilder: (_, int index) {
          final serie = widget.series[index];

          serie.heroId = 'swiper-${serie.id}';

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: serie),
            child: Hero(
              tag: serie.heroId!,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/no-image.jpg'),
                      image: NetworkImage(serie.fullPosterImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  selected == index
                      ? Container(
                          width: double.infinity,
                          height: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                serie.name!,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'IMDb: ${serie.voteAverage}',
                                style: TextStyle(color: AppColors.gray),
                              ),
                              CustomButton(
                                  color: AppColors.primary,
                                  title: "Watch Now",
                                  onPress: () {})
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

            //  const SizedBox(
            //     height: 20,
            //   ),
            //   Expanded(
            //     child: Text(
            //       serie.name!,
            //       style: TextStyle(
            //           color: AppColors.white,
            //           fontSize: 28,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ),
            //   Text(
            //     'IMDb: ${serie.voteAverage}',
            //     style: TextStyle(color: AppColors.gray),
            //   ),
            //   const SizedBox(
            //     height: 10,
            //   ),
            //   CustomButton(
            //       color: AppColors.primary, title: "Watch Now", onPress: () {})