import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:personal_budget_workshop/model/record.dart';

class RecordProvider extends ChangeNotifier {
  final List<Record> _records = [];

  UnmodifiableListView<Record> get allRecords => UnmodifiableListView(_records);

  void addRecord(Record record) {
    record.id = record.hashCode;
    _records.add(record);
    notifyListeners();
  }

  void updateRecord(Record record) {
    int index = _records.indexWhere((recordSearch) => record.id == recordSearch.id);
    _records[index] = record;
    notifyListeners();
  }

  void deleteRecord(Record record) {
    _records.remove(record);
  }
}
