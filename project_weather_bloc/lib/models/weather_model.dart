class WeatherModel {
  final num currentTemp;
  final String currentSky;
  final num currentPressure;
  final num currentWindSpeed;
  final num currentHumidity;

  WeatherModel(
      {required this.currentTemp,
      required this.currentSky,
      required this.currentPressure,
      required this.currentWindSpeed,
      required this.currentHumidity});

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map["list"][0];

    return WeatherModel(
      currentTemp: currentWeatherData["main"]["temp"],
      currentSky: currentWeatherData["weather"][0]["main"],
      currentPressure: currentWeatherData["main"]["pressure"],
      currentWindSpeed: currentWeatherData["wind"]["speed"],
      currentHumidity: currentWeatherData["main"]["humidity"],
    );
  }
}
