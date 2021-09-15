import 'package:flutter/material.dart';
import 'package:tv_series_app/TVSeries/models/series_response.dart';
import 'package:tv_series_app/utils/app_colors.dart';
import 'package:tv_series_app/widgets/custom_button.dart';

class VerticalSeriesSlider extends StatefulWidget {
  final List<Series> series;
  final String? title;
  final Function onNextPage;

  const VerticalSeriesSlider(
      {Key? key, required this.series, this.title, required this.onNextPage})
      : super(key: key);

  @override
  _VerticalSeriesSliderState createState() => _VerticalSeriesSliderState();
}

class _VerticalSeriesSliderState extends State<VerticalSeriesSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 640,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                widget.title!,
                style: TextStyle(
                    fontSize: 24,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: widget.series.length,
                itemBuilder: (_, int index) => _SeriesPoster(
                    widget.series[index],
                    '${widget.title}-$index-${widget.series[index].id}')),
          ),
        ],
      ),
    );
  }
}

class _SeriesPoster extends StatelessWidget {
  final Series serie;
  final String heroId;

  const _SeriesPoster(this.serie, this.heroId);

  @override
  Widget build(BuildContext context) {
    serie.heroId = heroId;

    return Container(
      width: 130,
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: serie),
            child: Hero(
              tag: serie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(serie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serie.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'IMDb ${serie.voteAverage}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.gray, fontSize: 11),
                ),
                            const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    color: AppColors.primary, title: "Watch Now", onPress: () {}, fontSize: 14,size: 120,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
