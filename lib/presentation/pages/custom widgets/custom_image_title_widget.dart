import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_solid_principle/core/constants/constants.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';

class CustomImageTitleWidget extends StatelessWidget {
  const CustomImageTitleWidget({
    super.key,
    required this.weather,
  });

  final WeatherEntity? weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage(
            scale: 2,
            Urls.weatherIcon(
              weather!.iconCode,
            ),
          ),
        ),
        Text(
          weather!.main.toUpperCase(),
          style: const TextStyle(
            // color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}

