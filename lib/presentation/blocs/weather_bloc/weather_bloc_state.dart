import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity? result;

  const WeatherLoaded({required this.result});

  @override
  List<Object?> get props => [result];
}

class WeatherLoadFailure extends WeatherState {
  final String? message;

  const WeatherLoadFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
