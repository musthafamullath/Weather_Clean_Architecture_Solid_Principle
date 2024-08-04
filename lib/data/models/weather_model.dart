import 'package:weather_clean_architecture_solid_principle/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required super.cityName,
      required super.main,
      required super.description,
      required super.iconCode,
      required super.id,
      required super.temperature,
      required super.pressure,
      required super.humidity,
      required super.sunrise,
      required super.sunset});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json['weather'][0]['id'],
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        sunrise:
            DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
        sunset:
            DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000),
        humidity: json['main']['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'id' : id,
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'sys': {
          'sunrise': sunrise,
          'sunset': sunset,
        },
        'name': cityName,
      };

  WeatherEntity toEntity() => WeatherEntity(
        id: id,
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        temperature: temperature,
        pressure: pressure,
        sunrise: sunrise,
        sunset: sunset,
        humidity: humidity,
      );
}
