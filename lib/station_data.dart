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
          final data = [
            {
              "data": snapshot.data['tempnow'].toString(),
              "label": "Temperature [C]",
              "icon": Icons.thermostat,
            },
            {
              "data": snapshot.data['precipitation1d'].toString(),
              "label": "Rain in a day [mm]",
              "icon": Icons.cloud,
            },
            {
              "data": snapshot.data['windspeed'].toString(),
              "label": "Wind [m/s]",
              "icon": Icons.air,
            },
            {
              "data": snapshot.data['winddir'].toString(),
              "label": "Wind Direction [°]",
              "icon": Icons.rotate_left,
            },
            {
              "data": snapshot.data['windchill'].toString(),
              "label": "Feels Like [C]",
              "icon": Icons.accessibility,
            },
            {
              "data": snapshot.data['timestamp'].toString(),
              "label": "Timestamp",
              "icon": Icons.access_time_filled,
            },
          ];

          return Column(
            children: [
              Column(
                children: data
                    .map(
                      (element) => StationDataCard(
                        element["data"] as String,
                        element["label"] as String,
                        element["icon"] as IconData,
                      ),
                    )
                    .toList(),
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
