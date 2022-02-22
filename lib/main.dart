import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'station.dart';
import 'about.dart';
import 'swiper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  //const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/willab',
      routes: {
        '/willab': (context) => Station('Willab'),
        '/about': (context) => About(),
        '/swiper': (context) => Swiper(),
      },
    );
  }
}
