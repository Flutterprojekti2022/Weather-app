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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/about',
                );
              },
            ),
            ListTile(
              title: const Text('Swiper',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/swiper',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
