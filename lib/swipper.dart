import 'package:flutter/material.dart';

class Swipper extends StatelessWidget {
  final pages = PageView(
    controller: PageController(),
    children: [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.blue,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipper'),
      ),
      body: pages,
    );
  }
}
