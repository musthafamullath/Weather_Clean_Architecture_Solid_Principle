import 'package:flutter/material.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_row_asset_image_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_row_date_time_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_row_text_widget.dart';

class CostumTableTopRowWidget extends StatelessWidget {
  const CostumTableTopRowWidget({
    super.key,
    required this.weather,
    required this.size,
  });

  final WeatherEntity? weather;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const CustomTableRowAssetImageWidget(
              string: 'assets/icons/10.png',
            ),
            const SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTableRowTextWidget(
                  string: 'Sunrise',
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomTableRowDateTimeWidget(
                  weather: weather,
                  string: 'hh:mm a',
                ),
              ],
            ),
            SizedBox(
              width: size.width * 2.73 / 10,
            ),
            const CustomTableRowAssetImageWidget(
              string: 'assets/icons/11.png',
            ),
            const SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTableRowTextWidget(
                  string: 'Sunset',
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomTableRowDateTimeWidget(
                  weather: weather,
                  string: 'hh:mm a',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
