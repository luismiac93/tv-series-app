import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:tv_series_app/TVSeries/models/details_serie_response.dart';
import 'package:tv_series_app/TVSeries/models/seasons_serie_response.dart';
import 'package:tv_series_app/TVSeries/models/series_response.dart';

class TVSeriesRepository with ChangeNotifier {
  String _apiKey = 'e252f5c2c778f5707f5ca4dbf7044b89';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'en-US';

  List<Series> popularSeries = [];
  List<Series> recommendationsSeries = [];
  List<Series> favorites = [];

  int _popularPage = 0;
  int _recommendationsPage = 0;

  TVSeriesRepository() {
    getPopularSeries();
    getRecommendationsSeries();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getPopularSeries() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/tv/popular', _popularPage);
    final popularResponse = tvSeriesResponseFromJson(jsonData);
    popularSeries = [...popularSeries, ...popularResponse.results!];
    notifyListeners();
  }

  getRecommendationsSeries() async {
    _recommendationsPage++;

    final jsonData = await _getJsonData('3/tv/top_rated', _recommendationsPage);
    final recommendationsResponse = tvSeriesResponseFromJson(jsonData);
    recommendationsSeries = [
      ...recommendationsSeries,
      ...recommendationsResponse.results!
    ];
    notifyListeners();
  }

  Future<SeasonsSerieResponse> getSeasonsEpisodes(int serieId) async {
    final SeasonsSerieResponse seasonsList;
    final jsonData = await this._getJsonData('/3/tv/$serieId');
    final detailsResponse = detailsSerieResponseFromJson(jsonData);

    final jsonDataSeasons = await this._getJsonData('/3/tv/$serieId/season/1');
    final seasonsResponse = seasonsSerieResponseFromJson(jsonDataSeasons);
    seasonsList = seasonsResponse;

    return seasonsList;
  }

  addFavorite(Series serie){
    favorites = [serie,...favorites];
    notifyListeners();
  }
}
