import 'package:flutter/material.dart';

class HamburgerTile extends StatelessWidget {
  String title;
  String page;

  HamburgerTile(this.title, this.page);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          page,
        );
      },
    );
  }
}
