import 'package:flutter/material.dart';

class CardFirestore extends StatelessWidget {
  String text;

  CardFirestore(this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
