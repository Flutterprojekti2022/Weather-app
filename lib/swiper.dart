import 'package:flutter/material.dart';

class Swiper extends StatelessWidget {
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
        title: const Text('Swiper'),
      ),
      body: pages,
    );
  }
}
