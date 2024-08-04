import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final int id;
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final DateTime sunrise;
  final DateTime sunset;
  final double temperature;
  final int pressure;
  final int humidity;

  const WeatherEntity({
    required this.id,
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
    id,
    cityName,
    main,
    description,
    iconCode,
    temperature,
    pressure,
    humidity,
    sunrise,
    sunset,
  ];
}
