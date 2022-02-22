import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/station_data.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'hamburger_tile.dart';

class Station extends StatelessWidget {
  String title;

  Station(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('Tiedot/km5TNqwRkjSXxtLyAiWw/lisatiedot')
              .snapshots()
              .listen((data) {
            data.docs.forEach((doc) {
              print(doc['tiedot']);
            });
          });
        },
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Tiedot/km5TNqwRkjSXxtLyAiWw/lisatiedot')
                  .snapshots(),
              builder: (ctx, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final sdata = streamSnapshot.data;
                return ListView.builder(
                  itemCount: sdata.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => Container(
                    padding: EdgeInsets.all(8),
                    child: Text(streamSnapshot.data.docs[index]['tiedot']),
                  ),
                );
              },
            ),
            Center(
              child: Image.asset('images/willab.gif'),
            ),
            StationData(),
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
                'Weather App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            HamburgerTile('About', '/about'),
            HamburgerTile('Swiper', '/swiper'),
          ],
        ),
      ),
    );
  }
}
