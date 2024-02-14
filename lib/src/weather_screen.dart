import 'package:flutter/material.dart';
import 'package:weatherapp_riverpod/src/widgets/weather_detail_widget.dart';
import 'package:weatherapp_riverpod/src/widgets/weather_search_widget.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherDetailWidget(),
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}
