import 'package:flutter/material.dart';
import 'package:tv_series_app/TVSeries/models/popular_series.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class SeriesSlider extends StatefulWidget {
  final List<Series> series;
  final String? title;
  final Function onNextPage;

  const SeriesSlider(
      {Key? key, required this.series, this.title, required this.onNextPage})
      : super(key: key);

  @override
  _SeriesSliderState createState() => _SeriesSliderState();
}

class _SeriesSliderState extends State<SeriesSlider> {
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
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                widget.title!,
                style: TextStyle(fontSize: 24, color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
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
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
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
          const SizedBox(height: 5),
          Text(
            serie.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle( color: AppColors.white),
          )
        ],
      ),
    );
  }
}
