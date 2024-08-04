import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_bottom_row_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_top_row_widget.dart';

class CustomTableDetailsWidgets extends StatelessWidget {
  const CustomTableDetailsWidgets({
    super.key,
    required this.weather,
    required this.size,
  });

  final WeatherEntity? weather;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CostumTableTopRowWidget(weather: weather, size: size),
        const Divider(
          color: Colors.grey,
        ),
        CustomTableBottomRowWidget(weather: weather, size: size),
      ],
    );
  }
}

