import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_series_app/TVSeries/models/seasons_serie_response.dart';
import 'package:tv_series_app/TVSeries/models/series_response.dart';
import 'package:tv_series_app/TVSeries/repository/tv_series_repository.dart';
import 'package:tv_series_app/utils/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Series serie = ModalRoute.of(context)!.settings.arguments as Series;
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
                Hero(
                  tag: serie.heroId!,
                  child: Text(
                    "${serie.name}",
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            _SerieSeasonsEpisodes(
              serie: serie,
            ),
          ]),
        ),
      ),
    );
  }
}

class _SerieSeasonsEpisodes extends StatelessWidget {
  final Series serie;
  const _SerieSeasonsEpisodes({
    Key? key,
    required this.serie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvSeriesRepository =
        Provider.of<TVSeriesRepository>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final PageController scrollController = PageController();
    return FutureBuilder(
      future: tvSeriesRepository.getSeasonsEpisodes(serie.id!),
      builder:
          (BuildContext context, AsyncSnapshot<SeasonsSerieResponse> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary)),
          );
        }
        final episodes = snapshot.data!.episodes;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          height: size.height * 0.8,
          child: PageView.builder(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            itemCount: episodes!.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            episodes[index].name!,
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory),
                          onPressed: () {
                            scrollController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeIn);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 18),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: AppColors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder:
                            const AssetImage('assets/images/no-image.jpg'),
                        image: NetworkImage(snapshot.data!.fullPosterImg),
                        width: size.width * 0.87,
                        height: 210,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      '${serie.name}',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'IMDb${episodes[index].voteAverage} | ${episodes[index].airDate.toString().split("-")[0]} | ${snapshot.data!.name}',
                      style: TextStyle(color: AppColors.gray),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: AppColors.gray,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${episodes[index].overview}',
                      style: TextStyle(
                          color: AppColors.white, height: 1.8, fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
