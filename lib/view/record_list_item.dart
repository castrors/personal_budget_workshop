import 'package:flutter/material.dart';
import 'package:personal_budget_workshop/model/record.dart';
import 'package:personal_budget_workshop/provider/record_provider.dart';
import 'package:personal_budget_workshop/screen/record_list_screen.dart';
import 'package:provider/provider.dart';

class RecordListItem extends StatelessWidget {
  final Record record;
  RecordListItem(
    this.record, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(record.hashCode.toString()),
      child: ListTile(
        leading: Text(record.amount.toString()),
        title: Text(record.description),
        subtitle: Text(record.date.toString()),
        trailing:
            Icon(record.isExpense ? Icons.money_off : Icons.attach_money),
        onTap: () => navigateToRecordDetail(context, record),
      ),
      onDismissed: (direction) {
        Provider.of<RecordProvider>(context, listen: false)
            .deleteRecord(record);
      },
    );
  }
}
