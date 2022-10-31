import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/data_repository_interface.dart';
import '../services/api.dart';
import '../services/model/endpoint_data.dart';

import 'widgets/data_card.dart';
import 'widgets/select_lang.dart';
import 'widgets/show_alert_dialog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointData? _endpointData;

  Future<void> _updateData() async {
    print('Updating data...');
    try {
      final dataRepository =
          Provider.of<DataRepositoryInterface>(context, listen: false);
      final endpointData =
          await dataRepository.getEndpointData(Endpoint.latest);
      setState(() {
        _endpointData = endpointData;
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
              children: [
                DataCard(
                  value: _endpointData?.stats.personnelUnits ?? 0,
                  valueChangedBy: _endpointData?.increase.personnelUnits ?? 0,
                  lossType: 'Personnel units',
                  image: 'assets/icon-people.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
