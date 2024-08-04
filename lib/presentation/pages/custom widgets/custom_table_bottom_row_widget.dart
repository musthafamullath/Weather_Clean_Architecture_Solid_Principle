import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_degree_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_row_asset_image_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_row_text_widget.dart';

class CustomTableBottomRowWidget extends StatelessWidget {
  const CustomTableBottomRowWidget({
    super.key,
    required this.weather,
    required this.size,
  });

  final WeatherEntity? weather;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          children: [
            CustomTableRowAssetImageWidget(string: 'assets/icons/12.png'),
          ],
        ),
        const SizedBox(width: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTableRowTextWidget(string: 'Temperature'),
            const SizedBox(
              height: 5.0,
            ),
            CustomTableDegreeWidget(
              weather: weather,
              string: weather!.temperature.toString(),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 2.4 / 10,
        ),
        const CustomTableRowAssetImageWidget(string: 'assets/icons/13.png'),
        const SizedBox(width: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTableRowTextWidget(string: 'Pressure'),
            const SizedBox(
              height: 3,
            ),
            CustomTableDegreeWidget(
              weather: weather,
              string: weather!.pressure.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
