import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personal_budget_workshop/model/record.dart';
import 'package:personal_budget_workshop/provider/record_provider.dart';

class AddRecordScreen extends StatefulWidget {
  @override
  _AddRecordScreenState createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  final taskTitleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;

    if (textVal.isNotEmpty) {
      final Record record = Record(
        description: textVal,
        completed: false,
      );
      Provider.of<RecordProvider>(context, listen: false).addRecord(record);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                key: Key("record_description"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: Key("record_amount"),
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: Key("record_date"),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.pop(context, Record(description: "", completed: false));
          }
        },
        child: Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
