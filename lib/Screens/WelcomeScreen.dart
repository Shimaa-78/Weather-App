import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weatherapp/Screens/WeatherScreen.dart';

import '../cubits/weater_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5C6EE5),
              Color(0xff99A0FA),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/icon.png")),
            SizedBox(
              height: 30,
            ),
            Text(
              "Weather",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "kavoon",
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                // onChanged: (val){},
                onFieldSubmitted: (val) async {
                  BlocProvider.of<WeatherCubit>(context).getWeatherData(val);
                  Get.to(WeatherScreen());
                },
                cursorHeight: 30,
                decoration: InputDecoration(
                  label: Text(
                    "Search ",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "kavoon",
                    ),
                  ),
                  hintText: "Enter City Name",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "kavoon",
                  ),
                  //  labelText: "Enter City Name",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        // color: Colors.orange,
                        ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
