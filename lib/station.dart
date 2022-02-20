import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Station extends StatelessWidget {
  //const Station({Key? key}) : super(key: key);
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

class WeatherBody extends StatefulWidget {
  const WeatherBody({Key? key}) : super(key: key);

  @override
  _WeatherBodyState createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  var weather = fetchWeather();
  var fetched = false;

  //_WeatherBodyState() {
  //  fetch();
  //}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: weather,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Text('${snapshot.data}');
          } else {
            return Text('Hetkinen');
          }
        });
  }
}

fetchWeather() async {
  final url = Uri.parse('http://weather.willab.fi/weather.json');
  var response = await get(url);
  return jsonDecode(response.body);
}
