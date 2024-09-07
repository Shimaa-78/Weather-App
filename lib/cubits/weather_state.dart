part of 'weater_cubit.dart';

@immutable
sealed class WeatherState {}

final class WheaterInitial extends WeatherState {}
final class WheaterLoading extends WeatherState {}
final class WheaterSuccesd extends WeatherState {
  final WeatherModel weather;

  WheaterSuccesd({required this.weather});
}
final class WheaterError extends WeatherState {}
