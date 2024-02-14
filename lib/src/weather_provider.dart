import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp_riverpod/src/weather_api_service.dart';
import 'package:weatherapp_riverpod/src/weather_controller.dart';
import 'package:weatherapp_riverpod/src/weather_model.dart';

final weatherRepositoryProvider = Provider<ApiService>((ref) => ApiService());

final weatherProvider =
    StateNotifierProvider.autoDispose<WeatherController, WeatherModel>(
  (ref) => WeatherController(ref),
);
