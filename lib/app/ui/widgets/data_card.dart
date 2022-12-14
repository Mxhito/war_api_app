import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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

  String formatValue(int value) {
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Earlies version of text overflowing
            Text(
              lossType,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 8.0,
            ),
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
                      formatValue(value),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Visibility(
                      visible: valueChangedBy != 0,
                      child: Text(
                        '(+${formatValue(valueChangedBy)})',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
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
