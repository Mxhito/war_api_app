import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/repository/repository.dart';
import 'app/ui/dashboard.dart';

void main() async {
  Intl.defaultLocale = 'en_GB';
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<RepositoryInterface>(
      create: (_) => RepositoryInterface(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF101010),
          canvasColor: const Color(0xFF222222),
        ),
        home: const Dashboard(),
      ),
    );
  }
}
