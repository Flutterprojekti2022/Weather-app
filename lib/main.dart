import 'package:flutter/material.dart';

import 'station.dart';
import 'about.dart';
import 'swipper.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
