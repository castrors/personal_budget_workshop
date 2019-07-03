import 'package:flutter/material.dart';
import 'package:personal_budget_workshop/model/record.dart';
import 'package:personal_budget_workshop/provider/record_provider.dart';
import 'package:personal_budget_workshop/screen/record_detail_screen.dart';
import 'package:personal_budget_workshop/view/record_list_item.dart';
import 'package:provider/provider.dart';

class RecordListScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orçamento Pessoal'),
      ),
      body: Consumer<RecordProvider>(builder: (context, records, child) {
        return ListView.builder(
            itemCount: records.allRecords.length,
            itemBuilder: (BuildContext context, int index) =>
                RecordListItem(records.allRecords[index]));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToRecordDetail(context, Record()),
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ),
    );
  }
}

void navigateToRecordDetail(BuildContext context, Record record) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RecordDetailScreen(record: record),
    ),
  );
}
