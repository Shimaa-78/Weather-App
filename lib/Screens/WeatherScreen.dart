import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/WeatherModel.dart';
import 'package:weatherapp/cubits/weater_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WheaterLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WheaterError) {
            return Center(
              child: Text(
                "Error",
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state is WheaterSuccesd) {
            WeatherModel weather = state.weather; // Access weather data here
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffD9D9D9),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: 50, color: Color(0xff3A3C8F)),
                            Text(
                              "${weather.cityName}",
                              style: TextStyle(
                                color: Color(0xff3A3C8F),
                                fontSize: 40,
                                fontFamily: "JosefinSans",
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${weather.forecastDays[0].dayName}, ${weather.forecastDays[0].formattedDate}",
                          style: TextStyle(
                            color: Color(0xff3A3C8F),
                            fontSize: 18,
                            fontFamily: "JosefinSans",
                          ),
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 160,
                                      child: Text(
                                        "${weather.Temp.round()}",
                                        style: TextStyle(
                                          color: Color(0xff5157EB),
                                          fontSize: 150,
                                          fontFamily: "JosefinSans",
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${weather.forecastDays[0].condition}",
                                      style: TextStyle(
                                        color: Color(0xff5157EB),
                                        fontSize: 18,
                                        fontFamily: "JosefinSans",
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 25,
                                  bottom: 110,
                                  child:   Image(image: NetworkImage("https:${weather.forecastDays[0].iconPath}",)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      "7 Days Forecast",
                      style: TextStyle(
                        color: Color(0xff5157EB),
                        fontSize: 20,
                        fontFamily: "JosefinSans",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: weather.forecastDays.length,
                        itemBuilder: (context, index) {
                          var forecast = weather.forecastDays[index];
                          return Container(
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color(0xff5C6EE5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${forecast.dayName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Image(image: NetworkImage("https:${forecast.iconPath}")),
                                Text(
                                  "${forecast.maxTemp.round()}°C",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "${forecast.minTemp.round()}°C",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            );
          }
          return Center(child: Text("Try Later"));
        },
      ),
    );
  }
}
