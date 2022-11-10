import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedDateFormatter {
  LastUpdatedDateFormatter({required this.lastUpdated});
  final DateTime? lastUpdated;

  String lastUpdatedStatustext() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd();
      final formatted = formatter.format(lastUpdated!);
      //TODO 1.1) create dict
      return 'Станом на $formatted';
    }
    return '';
  }
}

class LastUpdatedStatusText extends StatelessWidget {
  const LastUpdatedStatusText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
