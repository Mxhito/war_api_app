import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/repository.dart';
import '../services/api.dart';

import 'widgets/data_card.dart';
import 'widgets/last_updated_status_text.dart';
import 'widgets/show_alert_dialog.dart';
import 'widgets/ticker.dart';

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

  Future<void> _updateData() async {
    try {
      final repository =
          Provider.of<RepositoryInterface>(context, listen: false);
      final data = await Future.wait([
        repository.getStats(),
        repository.getStatsIncrease(),
        repository.getNames(endpoint: Endpoint.termsUa),
        repository.getIcons(),
        repository.getLastUpdateDate(),
      ]);
      setState(() {
        _stats = data[0] as List<int>?;
        _statsIncrease = data[1] as List<int>?;
        _lossTypeNames = data[2] as List<String>?;
        _iconURls = data[3] as List<String>?;
        _lastUpdateDate = data[4] as DateTime?;
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
    _updateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatter =
        LastUpdatedDateFormatter(lastUpdated: _lastUpdateDate);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'War',
              style: TextStyle(color: Colors.redAccent),
            ),
            Text(
              'Tracker',
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              //TODO 1) Localization and update data with choosen language
              setState(() {
                isUkrainian = !isUkrainian;
              });
            },
            icon: isUkrainian
                ? const Text(
                    'EN',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  )
                : const Text(
                    'UA',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
            splashRadius: 25.0,
          ),
          IconButton(
            onPressed: () {
              //TODO 2) Changing the theme from light to dark and vice versa
            },
            icon: const Icon(Icons.sunny),
            color: Colors.yellowAccent,
            splashRadius: 25.0,
          ),
          IconButton(
            onPressed: () {
              //TODO 3) Connect payment for donate
            },
            icon: const Icon(Icons.payments),
            color: Colors.greenAccent,
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
                LastUpdatedStatusText(
                  text: dateFormatter.lastUpdatedStatustext(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _stats?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return DataCard(
                      value: _stats?[index] ??
                          0, //if null - value from ShPr and later DB
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
      bottomNavigationBar: const BottomAppBar(
        child: Ticker(),
      ),
    );
  }
}
