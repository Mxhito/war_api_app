import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Ticker extends StatelessWidget {
  const Ticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Marquee(
        text:
            'Російський військовий кораблю, іди нахуй!  🚢  Russian warship, go fuck yourself!  🚢  Русский военный корабль, иди нахуй! 🚢  ',
        style: Theme.of(context).primaryTextTheme.headline6,
        velocity: 30.0,
      ),
    );
  }
}
