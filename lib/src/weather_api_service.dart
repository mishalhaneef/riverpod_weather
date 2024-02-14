import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp_riverpod/api/api_constant.dart';
import 'package:weatherapp_riverpod/api/api_keys.dart';

import 'weather_model.dart';

class ApiService {
  static const String baseUrl = ApiConstant.baseUrl;
  static const String currentWeatherEndpoint = ApiConstant.currentWeather;

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final uri = Uri.parse(
          '$baseUrl$currentWeatherEndpoint?key=${ApiKeys.apiKey}&q=$cityName');

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return WeatherModel.fromJson(json);
      } else {
        print('Failed to fetch weather data: status ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
