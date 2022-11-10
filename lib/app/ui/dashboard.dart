import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/cache/data_cache_service.dart';
import '../repository/repository.dart';
import '../services/api/api.dart';
import '../theme/theme_model.dart';

import 'widgets/data_card.dart';
import 'widgets/last_updated_status_text.dart';
import 'widgets/show_alert_dialog.dart';
import 'widgets/ticker.dart';
import 'widgets/wartime_counter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isUkrainian = true;

  List<int>? _stats;
  List<int>? _statsIncrease;
  List<String>? _lossTypeNames;
  List<String>? _iconURls;
  DateTime? _lastUpdateDate;
  int? _dayOfWar;

  Future<void> _updateData() async {
    try {
      final repository =
          Provider.of<RepositoryInterface>(context, listen: false);
      final data = await Future.wait([
        repository.getStats(),
        repository.getStatsIncrease(),
        repository.getNames(
            endpoint: isUkrainian ? Endpoint.termsUa : Endpoint.termsEn),
        repository.getIcons(),
        repository.getLastUpdateDate(),
        repository.getDayOfWar(),
      ]);
      await DataCacheService.setDay(data[5] as int);
      setState(() {
        _stats = data[0] as List<int>?;
        _statsIncrease = data[1] as List<int>?;
        _lossTypeNames = data[2] as List<String>?;
        _iconURls = data[3] as List<String>?;
        _lastUpdateDate = data[4] as DateTime?;
        _dayOfWar = data[5] as int?;
      });
    } on SocketException catch (_) {
      showAlertDialog(
        context: context,
        title: 'Connection error',
        content: 'Couldn`t retrive data. Please try again later.',
        defaultActionText: 'OK',
      );
    } catch (_) {
      showAlertDialog(
        context: context,
        title: 'Unknown error',
        content: 'Contact support or try again later.',
        defaultActionText: 'OK',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _updateData();
    //! Данние закэшировались, нужно проделать это со всеми данними
    _dayOfWar = DataCacheService.getDay();
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatter =
        LastUpdatedDateFormatter(lastUpdated: _lastUpdateDate);

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Text('War', style: TextStyle(color: Colors.redAccent)),
              Text('Tracker'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                //TODO 1) Localization
                setState(() {
                  isUkrainian = !isUkrainian;
                  _updateData();
                });
              },
              icon: Text(
                isUkrainian ? 'EN' : 'UA',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 16,
                ),
              ),
              splashRadius: 25.0,
            ),
            IconButton(
              onPressed: () {
                themeModel.isDark
                    ? themeModel.isDark = false
                    : themeModel.isDark = true;
              },
              icon: Icon(themeModel.isDark ? Icons.wb_sunny : Icons.mode_night),
              color: themeModel.isDark
                  ? Colors.yellowAccent[700]
                  : Colors.yellow[700],
              splashRadius: 25.0,
            ),
            IconButton(
              onPressed: () {
                print('ты красавчик :]');
                //TODO 3) Connect payment for donate
              },
              icon: const Icon(Icons.payments),
              color: themeModel.isDark
                  ? Colors.greenAccent[700]
                  : Colors.green[700],
              splashRadius: 25.0,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: RefreshIndicator(
              onRefresh: _updateData,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LastUpdatedStatusText(
                        text: dateFormatter.lastUpdatedStatustext(),
                        //TODO 2) Shared Preferences
                      ),
                      WartimeCounter(dayOfWar: _dayOfWar ?? 0),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _stats?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return DataCard(
                        value: _stats?[index] ?? 0,
                        valueChangedBy: _statsIncrease?[index] ?? 0,
                        lossType: _lossTypeNames?[index] ?? '',
                        image: _iconURls?[index] ??
                            'https://russianwarship.rip/images/icons/icon-people.svg',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        //* Uncomment in final
        bottomNavigationBar: const BottomAppBar(
          child: Ticker(),
        ),
      );
    });
  }
}
