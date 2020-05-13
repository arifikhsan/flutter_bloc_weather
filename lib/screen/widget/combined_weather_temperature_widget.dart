import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather/model/weather.dart';
import 'package:flutter_bloc_weather/screen/widget/temperature_widget.dart';
import 'package:flutter_bloc_weather/screen/widget/weather_conditions_widget.dart';

class CombinedWeatherTemperatureWidget extends StatelessWidget {
  final Weather weather;

  CombinedWeatherTemperatureWidget({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: WeatherConditionsWidget(condition: weather.condition),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TemperatureWidget(
                temperature: weather.temp,
                high: weather.maxTemp,
                low: weather.minTemp,
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
