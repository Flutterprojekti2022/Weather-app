import 'package:flutter/material.dart';

class StationCard extends StatefulWidget {
  String title;
  String subtitle;
  IconData icon;

  StationCard(this.title, this.subtitle, this.icon);

  @override
  State<StationCard> createState() => _StationCardState();
}

class _StationCardState extends State<StationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.title.toString(),
        ),
        subtitle: Text(
          widget.subtitle,
        ),
        leading: Icon(
          widget.icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}
