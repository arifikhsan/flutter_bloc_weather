import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_weather/model/weather.dart';
import 'package:flutter_bloc_weather/repository/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({
    @required this.weatherApiClient,
  }) : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
