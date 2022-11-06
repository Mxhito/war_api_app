import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/repository.dart';
import '../services/api.dart';

import 'widgets/data_card.dart';
import 'widgets/last_updated_status_text.dart';
import 'widgets/select_lang.dart';
import 'widgets/show_alert_dialog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<List<int>>? _endpointData;
  List<Map<String, String>>? _termsData;
  DateTime? _lastUpdateDate;

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<RepositoryInterface>(context, listen: false);
      final values = await Future.wait([
        dataRepository.getEndpointData(endpoint: Endpoint.latest),
        dataRepository.getAllTerms(endpoint: Endpoint.termsUa),
        dataRepository.getLastUpdateDate(),
      ]);
      setState(() {
        _endpointData = values[0] as List<List<int>>?;
        _termsData = values[1] as List<Map<String, String>>?;
        _lastUpdateDate = values[2] as DateTime?;
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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sunny),
          splashRadius: 25.0,
        ),
        title: const Text('War Tracker'),
        centerTitle: true,
        actions: const [
          SelectLanguage(),
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
                  itemCount: _termsData?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return DataCard(
                      value: _endpointData?[index][0] ??
                          0, //if null - value from ShPr and later DB
                      valueChangedBy: _endpointData?[index][1] ?? 0,
                      lossType: _termsData?[index]['title'] ?? '',
                      image: _termsData?[index]['icon'] ??
                          'https://russianwarship.rip/images/icons/icon-people.svg',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
