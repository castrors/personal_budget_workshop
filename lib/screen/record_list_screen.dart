import 'package:flutter/material.dart';
import 'package:personal_budget_workshop/model/record.dart';
import 'package:personal_budget_workshop/provider/record_provider.dart';
import 'package:personal_budget_workshop/screen/add_record_screen.dart';
import 'package:provider/provider.dart';

class RecordListScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orçamento Pessoal'),
      ),
      body: Consumer<RecordProvider>(builder: (context, records, child) {
        return ListView(
            children: records.allRecords
                .map(
                  (record) => ListTile(
                        leading: Text(
                          record.amount.toString(),
                        ),
                        title: Text(record.description),
                        subtitle: Text(record.date.toString()),
                        trailing: Icon(record.isExpense
                            ? Icons.money_off
                            : Icons.monetization_on),
                      ),
                )
                .toList());
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRecordScreen(record: Record()),
            ),
          );
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ),
    );
  }
}
