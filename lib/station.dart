import 'package:flutter/material.dart';

import 'package:weather_app/station_data.dart';

class Station extends StatelessWidget {
  String title;

  Station(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset('images/willab.gif'),
            ),
            const StationData(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/about',
                  ),
                  child: const Text('About'),
                ),
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/swiper',
                  ),
                  child: const Text('Swiper'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
