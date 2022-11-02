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
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lossType,
              style: Theme.of(context).primaryTextTheme.headline6,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.network(
                  image,
                  placeholderBuilder: (BuildContext context) =>
                      const CircularProgressIndicator(),
                ),
                Row(
                  children: [
                    Text(
                      '$value',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                    const SizedBox(width: 8.0),
                    Visibility(
                      visible: valueChangedBy != 0,
                      child: Text(
                        '(+$valueChangedBy)',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
