import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  double sliderValue = 0;

  setSliderValue(double newValue) {
    setState(() {
      sliderValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Slider(
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: setSliderValue,
              value: sliderValue,
            ),
          ),
          Text(
            sliderValue.round().toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
