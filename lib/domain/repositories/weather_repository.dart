import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';
import 'package:weather_clean_architecture_solid_principle/core/handlers/failure/weather_failure.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<WeatherFailure, WeatherEntity>> getCurrentWeatherUsecase(
      String cityName);
}
