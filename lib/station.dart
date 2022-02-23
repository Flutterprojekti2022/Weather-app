import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/station_data.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'hamburger_tile.dart';
import 'card_firestore.dart';

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
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Tiedot/km5TNqwRkjSXxtLyAiWw/lisatiedot')
                  .snapshots(),
              builder: (
                BuildContext ctx,
                AsyncSnapshot<QuerySnapshot> streamSnapshot,
              ) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: streamSnapshot.data?.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => CardFirestore(
                    streamSnapshot.data?.docs[index]['tiedot'],
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
