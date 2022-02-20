import 'package:flutter/material.dart';

class StationCard extends StatelessWidget {
  //const StationCard({Key? key}) : super(key: key);

  String title;
  String subtitle;
  //Icon icon;
  IconData icon;

  StationCard(this.title, this.subtitle, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title.toString(),
        ),
        subtitle: Text(
          subtitle,
        ),
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
        //leading: icon,
      ),
    );
  }
}
