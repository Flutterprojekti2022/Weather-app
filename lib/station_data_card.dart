import 'package:flutter/material.dart';

class StationDataCard extends StatefulWidget {
  String title;
  String subtitle;
  IconData icon;

  StationDataCard(this.title, this.subtitle, this.icon);

  @override
  State<StationDataCard> createState() => _StationDataCardState();
}

class _StationDataCardState extends State<StationDataCard> {
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
