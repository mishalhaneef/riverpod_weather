import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp_riverpod/src/weather_provider.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey[200], // Adjust the color as needed
        ),
        child: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Enter city name',
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            ref.read(weatherProvider.notifier).fetchWeather(value);
          },
        ),
      ),
    );
  }
}
