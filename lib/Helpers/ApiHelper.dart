import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/Models/WeatherModel.dart';

class ApiHelper{
  static Dio dio = Dio(

      BaseOptions(
          baseUrl: "https://api.weatherapi.com/v1/"
      )
  );
  static Future<WeatherModel?> getData(String city) async {
    try {
      String key = "e84a972d60694b798c512933240609";
      Response response = await dio.get(
          "forecast.json?key=$key&q=$city&days=7");
      WeatherModel Weather = WeatherModel.fromJson(response.data);

      return Weather;
    } on DioException catch (e) {
      String errorMessage = e.response?.data["error"]["message"]??"Oops there is an error,try later";
      throw Exception(errorMessage);
    }
    catch (e){
      log(e.toString() );
    }
  }
}