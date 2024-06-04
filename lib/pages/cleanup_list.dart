// cleanup_list.dart

import 'package:flutter/material.dart';
import 'package:globalsolution/components/list_item.dart';
import 'package:globalsolution/models/cleanup_solution_model.dart';

class CleanupList extends StatefulWidget {
  const CleanupList({Key? key}) : super(key: key);

  @override
  State<CleanupList> createState() => _CleanupListState();
}

class _CleanupListState extends State<CleanupList> {
  final List<CleanupSolution> list = CleanupSolution.getList();
  CleanupStatus? filterStatus;

  @override
  Widget build(BuildContext context) {
    List<CleanupSolution> filteredList = list;
    if (filterStatus != null) {
      filteredList = list.where((solution) => solution.status == filterStatus).toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                filterStatus = null;
              });
            },
            icon: Icon(Icons.refresh),
          ),
          PopupMenuButton<CleanupStatus?>(
            onSelected: (status) {
              setState(() {
                filterStatus = status;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem<CleanupStatus?>(
                value: CleanupStatus.inMaintenance,
                child: Text('In Maintenance'),
              ),
              PopupMenuItem<CleanupStatus?>(
                value: CleanupStatus.inOperation,
                child: Text('In Operation'),
              ),
              PopupMenuItem<CleanupStatus?>(
                value: CleanupStatus.harvesting,
                child: Text('Harvesting'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            return ListItem(item: filteredList[index]);
          },
        ),
      ),
    );
  }
}
