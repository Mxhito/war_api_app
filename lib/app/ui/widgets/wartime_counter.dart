import 'package:flutter/material.dart';

class WartimeCounter extends StatelessWidget {
  const WartimeCounter({super.key, required this.dayOfWar});

  final int dayOfWar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Text(
        '($dayOfWar-й день війни)',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
