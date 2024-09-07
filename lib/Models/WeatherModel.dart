import 'package:intl/intl.dart';

class ForecastDayModel {
  final String dayName;        // Full name of the day (e.g., Saturday)
  final String formattedDate;  // Formatted date (e.g., September 7, 2024)
  final String condition;      // Weather condition (e.g., Sunny, Rain)
  final String iconPath;       // Icon path for the weather condition
  final double maxTemp;        // Maximum temperature for the day
  final double minTemp;        // Minimum temperature for the day

  ForecastDayModel({
    required this.dayName,
    required this.formattedDate,
    required this.condition,
    required this.iconPath,
    required this.maxTemp,
    required this.minTemp,
  });

  // Factory constructor to create a ForecastDayModel from JSON data
  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    DateTime date = DateTime.parse(json["date"]);

    return ForecastDayModel(
      dayName: DateFormat('EEEE').format(date),
      formattedDate: DateFormat('MMMM d, y').format(date),
      condition: json["day"]["condition"]["text"],
      iconPath: json["day"]["condition"]["icon"],
      maxTemp: json["day"]["maxtemp_c"],
      minTemp: json["day"]["mintemp_c"],
    );
  }
}

class WeatherModel {
  final String cityName;         // Name of the city (e.g., Alexandria)
  final double Temp;      // Current temperature
  final List<ForecastDayModel> forecastDays; // 7-day forecast data

  WeatherModel({
    required this.cityName,
    required this.Temp,
    required this.forecastDays,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      Temp: json["current"]["temp_c"],
      forecastDays: (json["forecast"]["forecastday"] as List)
          .map((day) => ForecastDayModel.fromJson(day))
          .toList(),
    );
  }
}
