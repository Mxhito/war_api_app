import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataCard extends StatelessWidget {
  const DataCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('People', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 4.0),
            SizedBox(
              height: 52.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icon-people.svg'),
                  Text('0', style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
