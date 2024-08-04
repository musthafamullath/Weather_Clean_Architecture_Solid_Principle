import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';
import 'package:weather_clean_architecture_solid_principle/core/handlers/failure/weather_failure.dart';
import 'package:weather_clean_architecture_solid_principle/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentWeatherUsecase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUsecase(this.weatherRepository);

  Future<Either<WeatherFailure, WeatherEntity>> call(Params params)async {
    return await weatherRepository.getCurrentWeatherUsecase(params.cityName);
  }
}

class Params {
  final String cityName;

  Params({required this.cityName});
  
}
