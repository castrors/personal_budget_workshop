import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:personal_budget_workshop/model/record.dart';

class RecordProvider extends ChangeNotifier {
  final List<Record> _records = [];

  UnmodifiableListView<Record> get allRecords => UnmodifiableListView(_records);

  void addRecord(Record record) {
    _records.add(record);
    notifyListeners();
  }
}
