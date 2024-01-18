import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double?> getTemperature(double lat, double lon) async {
  String url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&units=imperial&appid=[Insert API key here]';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      double temp = data['current']['temp'];
      return temp;
    } else {
      print('Failed to load weather data');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

Future<double?> getWindDirection(double lat, double lon) async {
  String url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&units=imperial&appid=[Insert API key here]';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data['current']['wind_deg']);
      var wind = data['current']['wind_deg'];
      return wind * (5.14159165 / 180);
    } else {
      print('Failed to load weather data');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

Future<double?> getWindSpeed(double lat, double lon) async {
  String url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&units=imperial&appid=[Insert API key here]';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      double speed = (data['current']['wind_speed']);

      return speed;
    } else {
      print('Failed to load weather data');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
