// To parse this JSON data, do
//
//     final seasonsSerieResponse = seasonsSerieResponseFromJson(jsonString);

import 'dart:convert';

SeasonsSerieResponse seasonsSerieResponseFromJson(String str) =>
    SeasonsSerieResponse.fromJson(json.decode(str));

String seasonsSerieResponseToJson(SeasonsSerieResponse data) =>
    json.encode(data.toJson());

class SeasonsSerieResponse {
  SeasonsSerieResponse({
    this.id,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.seasonsSerieResponseId,
    this.posterPath,
    this.seasonNumber,
  });

  String? id;
  DateTime? airDate;
  List<Episode>? episodes;
  String? name;
  String? overview;
  int? seasonsSerieResponseId;
  String? posterPath;
  int? seasonNumber;

  get fullPosterImg {
    if (this.posterPath != null)
      return 'https://image.tmdb.org/t/p/w500${this.posterPath}';

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory SeasonsSerieResponse.fromJson(Map<String, dynamic> json) =>
      SeasonsSerieResponse(
        id: json["_id"],
        airDate: DateTime.parse(json["air_date"]),
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
        name: json["name"],
        overview: json["overview"],
        seasonsSerieResponseId: json["id"],
        posterPath: json["poster_path"],
        seasonNumber: json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "air_date": airDate,
        "episodes": List<dynamic>.from(episodes!.map((x) => x.toJson())),
        "name": name,
        "overview": overview,
        "id": seasonsSerieResponseId,
        "poster_path": posterPath,
        "season_number": seasonNumber,
      };
}

class Episode {
  Episode({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? seasonNumber;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        airDate: json["air_date"],
        episodeNumber: json["episode_number"],
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        productionCode: json["production_code"],
        seasonNumber: json["season_number"],
        stillPath: json["still_path"] == null ? null : json["still_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate,
        "episode_number": episodeNumber,
        "id": id,
        "name": name,
        "overview": overview,
        "production_code": productionCode,
        "season_number": seasonNumber,
        "still_path": stillPath == null ? null : stillPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
