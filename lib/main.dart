import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/delegate/simple_bloc_delegate.dart';
import 'package:flutter_bloc_weather/repository/weather_api_client.dart';
import 'package:flutter_bloc_weather/repository/weather_repository.dart';
import 'package:flutter_bloc_weather/screen/my_app_screen.dart';
import 'package:flutter_bloc_weather/theme/bloc/theme_bloc.dart';
import 'package:http/http.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      client: Client(),
    ),
  );
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc(),
      child: MyAppScreen(
        weatherRepository: weatherRepository,
      ),
    ),
  );
}
