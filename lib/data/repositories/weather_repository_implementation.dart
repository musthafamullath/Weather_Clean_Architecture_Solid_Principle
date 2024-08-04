import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_solid_principle/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';
import 'package:weather_clean_architecture_solid_principle/core/handlers/exception/weather_server_exception.dart';
import 'package:weather_clean_architecture_solid_principle/core/handlers/failure/weather_failure.dart';
import 'package:weather_clean_architecture_solid_principle/domain/repositories/weather_repository.dart';

class WeatherRepositoryImplementation extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImplementation({required this.weatherRemoteDataSource});

  @override
  Future<Either<WeatherFailure, WeatherEntity>> getCurrentWeatherUsecase(
      String cityName) async {
    try {
      final result =
          await weatherRemoteDataSource.getCurrentWeatherUsecase(cityName);
      return Right(result.toEntity());
    } on WeatherServerException {
      return const Left(
        WeatherServerFailure(
            'An Error Has Occurred During Searching The Location'),
      );
    } on SocketException {
      return const Left(
        WeatherConnectionFailure('Failed To Connect To The Network'),
      );
    }
  }
}
