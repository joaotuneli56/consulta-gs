// list_item.dart

import 'package:flutter/material.dart';
import 'package:globalsolution/models/cleanup_solution_model.dart';
import 'package:globalsolution/pages/cleanup_detail.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CleanupSolution item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.since),
      leading: Image.asset('images/${item.image}'),
      trailing: Text(item.statusDescription),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CleanupDetail(clpSolution: item)),
        );
      },
    );
  }
}
