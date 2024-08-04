import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_clean_architecture_solid_principle/domain/usecases/get_current_weather_usecase.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_event.dart';
import 'package:weather_clean_architecture_solid_principle/presentation/blocs/weather_bloc/weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUseCase;

  WeatherBloc(
    this.getCurrentWeatherUseCase,
  ) : super(WeatherInitial()) {
    on<OnCityChanged>(onCityChanged,
        transformer: debounce(const Duration(milliseconds: 500)));
  }

  Future<void> onCityChanged(
      OnCityChanged event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    final result =
        await getCurrentWeatherUseCase(Params(cityName: event.cityName));
    result.fold(
      (failure) {
        emit(WeatherLoadFailure(message: failure.message));
      },
      (data) {
        emit(WeatherLoaded(result: data));
      },
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
