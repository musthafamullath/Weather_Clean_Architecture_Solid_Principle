import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';

class CustomTableDegreeWidget extends StatelessWidget {
  final String string;
  const CustomTableDegreeWidget({
    super.key,
    required this.weather, required this.string,
  });

  final WeatherEntity? weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      weather!.pressure.toString(),
      style: const TextStyle(fontWeight: FontWeight.w900),
    );
  }
}
