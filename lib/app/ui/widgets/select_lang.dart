import 'package:flutter/material.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 83,
      child: Row(
        children: [
          SizedBox(
            width: 35,
            child: TextButton(
              onPressed: () {},
              child: const Text('UA'),
            ),
          ),
          const Text('/'),
          SizedBox(
            width: 35,
            child: TextButton(
              onPressed: () {},
              child: const Text('EN'),
            ),
          ),
        ],
      ),
    );
  }
}
