import 'package:dio/dio.dart';
import 'package:weather_clean_architecture_solid_principle/core/constants/constants.dart';
import 'package:weather_clean_architecture_solid_principle/data/models/weather_model.dart';
import 'package:weather_clean_architecture_solid_principle/core/handlers/exception/weather_server_exception.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeatherUsecase(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeatherUsecase(String cityName) async {
    try {
      final response = await client.get(Urls.currentWeatherByName(cityName));
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw WeatherServerException();
      }
    } catch (e) {
      throw WeatherServerException();
    }
  }
}
