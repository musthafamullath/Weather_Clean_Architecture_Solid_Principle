import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';

class CustomDiscriptionWidget extends StatelessWidget {
  const CustomDiscriptionWidget({
    super.key,
    required this.weather,
  });

  final WeatherEntity? weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      weather!.description,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}

