import 'package:flutter/material.dart';
import 'package:war_api_app/app/services/api.dart';
import 'package:war_api_app/app/services/api_service.dart';

import 'data_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  void _updateData() async {
    //* ALL WORKS
    final data = await APIService.getEndpointData(endpoint: Endpoint.latest);
    print(data.stats.personnelUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('War Tracker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListView(
            children: const [
              DataCard(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateData,
      ),
    );
  }
}
