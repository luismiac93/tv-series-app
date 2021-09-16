import 'package:flutter/material.dart';
import 'package:tv_series_app/TVSeries/models/series_response.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Series serie = ModalRoute.of(context)!.settings.arguments as Series;
    return Scaffold(
      body: Center(
        child: Text(serie.name!),
      ),
    );
  }
}
