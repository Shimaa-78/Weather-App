import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/Helpers/ApiHelper.dart';
import 'package:weatherapp/Models/WeatherModel.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WheaterInitial());
  late WeatherModel weather;

  void getWeatherData(String val) async {
    try {
      emit(WheaterLoading());
      weather = (await ApiHelper.getData(val))!;
      emit(WheaterSuccesd(weather: weather));
    } catch (e) {
      emit(WheaterError());
    }
  }
}
