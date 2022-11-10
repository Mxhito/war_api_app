import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/repository/repository.dart';
import 'app/theme/theme_model.dart';
import 'app/ui/dashboard.dart';
import 'app/theme/war_tracker_theme.dart';

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
    return MultiProvider(
      providers: [
        Provider<RepositoryInterface>(create: (_) => RepositoryInterface()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeModel.isDark ? WarTrackerTheme.dark() : WarTrackerTheme.light(),
          home: const Dashboard(),
        );
      }),
    );
  }
}
