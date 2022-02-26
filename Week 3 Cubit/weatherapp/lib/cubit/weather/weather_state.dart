part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;

  const factory WeatherState.loaded({
    final int? uname,
  }) = _loaded;
}

// class WeatherInitial extends _$WeatherState {
//   const WeatherInitial();
// }

// class WeatherLoaded extends _$WeatherState {
//   const WeatherLoaded();
// }

// class WeatherLoading extends _$WeatherState {
//   const WeatherLoading();
// }
