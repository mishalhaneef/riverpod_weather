import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp_riverpod/src/weather_model.dart';
import 'package:weatherapp_riverpod/src/weather_provider.dart';
import 'package:weatherapp_riverpod/src/widgets/error_widget.dart';
import 'package:weatherapp_riverpod/src/widgets/loading_widget.dart';

class WeatherDetailWidget extends ConsumerWidget {
  const WeatherDetailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherController = ref.watch(weatherProvider);
    final isLoading = weatherController.isLoading;
    final weatherData = weatherController.weatherData;

    if (isLoading ?? true) {
      return const LoadingIndicator();
    } else if (weatherData == null) {
      return const ErrorCard();
    } else {
      return _buildWeatherDetail(weatherData, context, weatherController);
    }
  }

  Widget _buildWeatherDetail(
    WeatherData weatherData,
    BuildContext context,
    WeatherModel weatherController,
  ) {
    return Column(
      children: [
        Image.network('https:${weatherData.weatherDetail?.icon}'),
        Text(weatherData.weatherDetail?.text ?? ""),
        const SizedBox(height: 10),
        Text(
          '${weatherData.tempC} °C',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '${weatherController.location?.name}, ${weatherController.location?.country}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
