import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    Key? key,
    required this.value,
    required this.valueChangedBy,
    required this.lossType,
    required this.image,
  }) : super(key: key);

  final int value;
  final int valueChangedBy;
  final String lossType;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.move_up),
            // ),
            SvgPicture.asset(image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('$value',
                        style: Theme.of(context).primaryTextTheme.headline4),
                    const SizedBox(width: 8.0),
                    Text('(+$valueChangedBy)',
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                Text(lossType,
                    style: Theme.of(context).primaryTextTheme.headline5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
