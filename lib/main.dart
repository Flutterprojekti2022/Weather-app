import 'package:flutter/material.dart';

import 'station.dart';
import 'about.dart';
import 'swipper.dart';

main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/willab',
      routes: {
        '/willab': (context) => Station('Willab'),
        '/about': (context) => const About(),
        '/swipper': (context) => Swipper(),
      },
    );
  }
}
