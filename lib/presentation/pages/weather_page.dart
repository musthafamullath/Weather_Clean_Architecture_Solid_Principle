import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_state.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_description_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_greating_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_humidity_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_image_icon_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_screen_color_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/widgets/custom_search_bar_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_spinkit_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_image_title_widget.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/custom%20widgets/custom_table_detail_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 2 * kToolbarHeight, 30, 20),
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                const CustomScreenColorWidget(
                  alignmentDirectional: AlignmentDirectional(4, -0.1),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF34A56F),
                  ),
                ),
                const CustomScreenColorWidget(
                  alignmentDirectional: AlignmentDirectional(-4, -0.1),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF34A56F),
                  ),
                ),
                const CustomScreenColorWidget(
                  alignmentDirectional: AlignmentDirectional(0, -1.2),
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 183, 255),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomSearchBarWidget(),
                        BlocBuilder<WeatherBloc, WeatherState>(
                          builder: (context, state) {
                            if (state is WeatherLoading) {
                              return const CustomSpinkitWidget();
                            } else if (state is WeatherLoadFailure) {
                              return Center(
                                child: Text(
                                  state.message ?? 'An Error Occurred',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            } else if (state is WeatherLoaded) {
                              final weather = state.result;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomGreatingWidget(weather: weather),
                                  getWeatherIcon(weather!.id),
                                  CustomHumidityWidget(weather: weather),
                                  CustomImageTitleWidget(weather: weather),
                                  CustomDiscriptionWidget(weather: weather),
                                  CustomTableDetailsWidgets(
                                      weather: weather, size: size),
                                  const SizedBox(height: 8.0),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
