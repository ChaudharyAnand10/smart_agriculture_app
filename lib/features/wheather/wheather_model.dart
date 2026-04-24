class WeatherModel {
  final String city;
  final double temp;
  final String condition;
  final int humidity;
  final double wind;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.condition,
    required this.humidity,
    required this.wind,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temp: json['main']['temp'].toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'].toDouble(),
    );
  }
}