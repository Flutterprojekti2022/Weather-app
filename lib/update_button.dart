import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  final Function update;

  UpdateButton(this.update);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => update(),
      icon: const Icon(
        Icons.autorenew,
      ),
      label: const Text(
        'Reload',
      ),
    );
  }
}
