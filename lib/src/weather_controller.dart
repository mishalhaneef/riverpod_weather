import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp_riverpod/src/weather_model.dart';
import 'package:weatherapp_riverpod/src/weather_provider.dart';

class WeatherController extends StateNotifier<WeatherModel> {
  WeatherController(this.ref) : super(WeatherModel(isLoading: false)) {
    fetchWeather("Hyderabad"); // Default City
  }

  final Ref ref;

  setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<void> fetchWeather(String cityName) async {
    try {
      setLoading(true);

      final weatherRepository = ref.read(weatherRepositoryProvider);
      final weatherData = await weatherRepository.getWeather(cityName);
      state = weatherData;
    } catch (e, stackTrace) {
      log("Error fetching weather data: $e", stackTrace: stackTrace);
    } finally {
      setLoading(false);
    }
  }
}
