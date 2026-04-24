import 'dart:convert';
import 'package:agro_app/features/wheather/wheather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = "febf864531b2d26c0e1898dd10903ac9";

  Future<WeatherModel> fetchWeather(double lat, double lon) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather");
    }
  }
}