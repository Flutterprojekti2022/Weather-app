import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'station_card.dart';

class Station extends StatelessWidget {
  String title;

  Station(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WeatherBody(),
    );
  }
}

class WeatherBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weather = fetchWeather();

    return FutureBuilder(
      future: weather,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Center(
                child: Image.asset('images/willab.gif'),
              ),
              StationCard(
                snapshot.data['tempnow'].toString(),
                'Temperature [C]',
                Icons.thermostat,
              ),
              StationCard(
                snapshot.data['precipitation1d'].toString(),
                'Rain in a day [mm]',
                Icons.water,
              ),
              StationCard(
                snapshot.data['windspeed'].toString(),
                'Wind [m/s]',
                Icons.air,
              ),
              StationCard(
                snapshot.data['winddir'].toString(),
                'Wind Direction',
                Icons.rotate_left,
              ),
              StationCard(
                snapshot.data['windchill'].toString(),
                'Feels Like [C]',
                Icons.accessibility,
              ),
              StationCard(
                snapshot.data['timestamp'],
                'Timestamp',
                Icons.access_time_filled,
              ),
              ElevatedButton.icon(
                onPressed: fetchWeather,
                icon: const Icon(
                  Icons.downloading,
                ),
                label: const Text(
                  'Reload',
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return const Text(
            'Error',
          );
        } else {
          return const Text(
            'Wait a moment',
          );
        }
      },
    );
  }
}

fetchWeather() async {
  var data = '''
    {
      "tempnow": -10.6,
      "temphi": -3.8,
      "templo": -12.9,
      "dewpoint": -11.6,
      "humidity": 93,
      "airpressure": 986.3,
      "windspeed": 1.0,
      "windspeedmax": 2.2,
      "winddir": 240,
      "precipitation1d": 0.0,
      "precipitation1h": 0.0,
      "solarrad": 1113,
      "windchill": -10.6,
      "timestamp": "2022-02-20 19:14 EET"
    }
  ''';
  return jsonDecode(data);
}

_fetchWeather() async {
  final url = Uri.parse('http://weather.willab.fi/weather.json');
  var response = await get(url);
  return jsonDecode(response.body);
}
