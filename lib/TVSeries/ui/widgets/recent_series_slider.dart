import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/TVSeries/models/series_response.dart';
import 'package:tv_series_app/TVSeries/repository/tv_series_repository.dart';
import 'package:tv_series_app/utils/app_colors.dart';
import 'package:tv_series_app/widgets/custom_button.dart';

class RecentSeriesSlider extends StatefulWidget {
  final List<Series> series;
  final String? title;
  final Function onNextPage;

  const RecentSeriesSlider(
      {Key? key, required this.series, this.title, required this.onNextPage})
      : super(key: key);

  @override
  _RecentSeriesSliderState createState() => _RecentSeriesSliderState();
}

class _RecentSeriesSliderState extends State<RecentSeriesSlider> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
    final tvSeriesRepository =
        Provider.of<TVSeriesRepository>(context, listen: false);
    serie.heroId = heroId;

    return Container(
      width: 130,
      height: 510,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Hero(
            tag: serie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage(serie.fullPosterImg),
                width: 300,
                height: 340,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Text(
              serie.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
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
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              style:
                  TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Go to view",
                    style: TextStyle(color: AppColors.primary),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.primary,
                  ),
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, 'details',
                          arguments: serie),
            ),
          ),
          Divider(
            color: AppColors.gray,
          ),
        ],
      ),
    );
  }
}
