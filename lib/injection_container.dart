import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_clean_architecture_solid_principle/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_clean_architecture_solid_principle/data/repositories/weather_repository_implementation.dart';
import 'package:weather_clean_architecture_solid_principle/domain/repositories/weather_repository.dart';
import 'package:weather_clean_architecture_solid_principle/domain/usecases/get_current_weather_usecase.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  // External
  locator.registerLazySingleton(() => Dio());

  // Data sources
  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: locator()));

  // Repositories
  locator.registerLazySingleton<WeatherRepository>(() =>
      WeatherRepositoryImplementation(weatherRemoteDataSource: locator()));

  // Use cases
  locator.registerLazySingleton(() => GetCurrentWeatherUsecase(locator()));

  // Blocs
  locator.registerFactory(() => WeatherBloc(
        locator(),
        // locator(),
      ));
}
