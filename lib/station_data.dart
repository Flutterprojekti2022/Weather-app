import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'station_data_card.dart';
import 'update_button.dart';

class StationData extends StatefulWidget {
  const StationData({Key? key}) : super(key: key);

  @override
  _StationDataState createState() => _StationDataState();
}

class _StationDataState extends State<StationData> {
  var weather = _fetchWeather();

  update() {
    setState(() {
      weather = _fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weather,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              StationDataCard(
                snapshot.data['tempnow'].toString(),
                'Temperature [C]',
                Icons.thermostat,
              ),
              StationDataCard(
                snapshot.data['precipitation1d'].toString(),
                'Rain in a day [mm]',
                Icons.cloud,
              ),
              StationDataCard(
                snapshot.data['windspeed'].toString(),
                'Wind [m/s]',
                Icons.air,
              ),
              StationDataCard(
                snapshot.data['winddir'].toString(),
                'Wind Direction [°]',
                Icons.rotate_left,
              ),
              StationDataCard(
                snapshot.data['windchill'].toString(),
                'Feels Like [C]',
                Icons.accessibility,
              ),
              StationDataCard(
                snapshot.data['timestamp'],
                'Timestamp',
                Icons.access_time_filled,
              ),
              UpdateButton(update),
            ],
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text(
                'Error',
              ),
              UpdateButton(update),
            ],
          );
        } else {
          return Column(
            children: [
              const Text(
                'Wait a moment',
              ),
              UpdateButton(update),
            ],
          );
        }
      },
    );
  }
}

fetchWeather() async {
  final url = Uri.parse('http://weather.willab.fi/weather.json');
  var response = await get(url);
  return jsonDecode(response.body);
}

_fetchWeather() async {
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
