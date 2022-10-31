import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/repository/data_repository_interface.dart';
import 'app/ui/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepositoryInterface>(
      create: (_) => DataRepositoryInterface(),
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
