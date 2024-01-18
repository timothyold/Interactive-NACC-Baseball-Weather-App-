// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mp5/models/models.dart';
import 'package:provider/provider.dart';
import 'package:mp5/providers/weather_provider.dart';

class FieldScreen extends StatefulWidget {
  final Field field;

  const FieldScreen({
    Key? key,
    required this.field,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FieldScreenState createState() => _FieldScreenState();
}

class _FieldScreenState extends State<FieldScreen> {
  @override
  void initState() {
    super.initState();
    // Request the weather data when the widget is initialized
    Provider.of<WeatherProvider>(context, listen: false)
        .fetchWeather(widget.field.lat, widget.field.lon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.field.name)),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.weather == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            Weather weather = weatherProvider.weather!;
            return buildWeatherUI(weather);
          }
        },
      ),
    );
  }

  Widget buildWeatherUI(Weather weather) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset('lib/assets/BaseballField.jpg'),
          Transform.rotate(
            angle: (weather.windDirection) - widget.field.facing,
            child:
                const Icon(Icons.arrow_upward, size: 200, color: Colors.black),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: <Widget>[
                Text('Wind Speed: ${weather.windSpeed} mph',
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold)),
                Text('Temperature: ${weather.temperature}°F',
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
