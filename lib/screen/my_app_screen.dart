import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/bloc/weather_bloc.dart';
import 'package:flutter_bloc_weather/repository/weather_repository.dart';
import 'package:flutter_bloc_weather/screen/widget/weather_widget.dart';
import 'package:flutter_bloc_weather/theme/bloc/theme_bloc.dart';

class MyAppScreen extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const MyAppScreen({
    Key key,
    this.weatherRepository,
  })  : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Flutter Weather',
          home: BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: weatherRepository,
            ),
            child: WeatherWidget(),
          ),
        );
      },
    );
  }
}
