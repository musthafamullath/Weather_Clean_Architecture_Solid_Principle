import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';

class CustomHumidityWidget extends StatelessWidget {
  const CustomHumidityWidget({
    super.key,
    required this.weather,
  });

  final WeatherEntity? weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${weather!.humidity.round()}\u00B0C',
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 55,
      ),
    );
  }
}

