import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';

class CustomTableRowDateTimeWidget extends StatelessWidget {
  final String string;
  const CustomTableRowDateTimeWidget({
    super.key,
    required this.weather,
    required this.string,
  });

  final WeatherEntity? weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat(string).format(weather!.sunset),
      style: const TextStyle(fontWeight: FontWeight.w900),
    );
  }
}
