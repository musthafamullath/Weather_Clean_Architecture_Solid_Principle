import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_solid_principle/injection_container.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_bloc.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/pages/weather_page.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<WeatherBloc>())
      ],
      child: MaterialApp(
        title: 'Weather Clean & Solid',
        theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        home: const WeatherPage(),
      ),
    );
  }
}
