import 'package:flutter/material.dart';
import 'package:personal_budget_workshop/provider/record_provider.dart';
import 'package:personal_budget_workshop/screen/record_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(PersonalBudgetApp());

class PersonalBudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => RecordProvider(),
      child: MaterialApp(
        title: 'Orçamento Pessoal',
        theme: ThemeData(
            primarySwatch: Colors.blue, accentColor: Colors.redAccent),
        home: RecordListScreen(),
      ),
    );
  }
}
