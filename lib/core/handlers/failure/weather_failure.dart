import 'package:equatable/equatable.dart';

abstract class WeatherFailure extends Equatable {
  final String? message;

  const WeatherFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class WeatherServerFailure extends WeatherFailure {
  const WeatherServerFailure(super.message);
}

class WeatherConnectionFailure extends WeatherFailure {
  const WeatherConnectionFailure(super.message);
}

class WeatherDatabaseFFailure extends WeatherFailure{
  const WeatherDatabaseFFailure(super.message);

}
