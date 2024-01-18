import 'package:flutter/material.dart';
import 'package:mp5/models/models.dart'; 
import 'package:mp5/providers/api_provider.dart'; 

class WeatherProvider with ChangeNotifier {
  Weather? _weather;

  Weather? get weather => _weather;

  Future<void> fetchWeather(double lat, double lon) async {
    try {
      double windDirection = await getWindDirection(lat, lon) ?? 0.0;
      double windSpeed = await getWindSpeed(lat, lon) ?? 0.0;
      double temperature = await getTemperature(lat, lon) ?? 0.0;

      _weather = Weather(
          windDirection: windDirection,
          windSpeed: windSpeed,
          temperature: temperature);
      notifyListeners(); // Notify listeners about the update
    } catch (e) {
      print('Error fetching weather: $e');
      // Handle the error state as needed
    }
  }
}
