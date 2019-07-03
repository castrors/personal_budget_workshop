import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:personal_budget_workshop/model/record.dart';
import 'package:personal_budget_workshop/provider/record_provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class RecordDetailScreen extends StatefulWidget {
  final Record record;

  RecordDetailScreen({this.record});
  @override
  _RecordDetailScreenState createState() => _RecordDetailScreenState();
}

class _RecordDetailScreenState extends State<RecordDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  Record _record;
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    _record = widget.record;
    isEditMode = _record.id != null;
  }

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (isEditMode) {
        Provider.of<RecordProvider>(context, listen: false).updateRecord(_record);
      } else {
        Provider.of<RecordProvider>(context, listen: false).addRecord(_record);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Registro'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: _record.amount.toString(),
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                decoration: InputDecoration(labelText: 'Valor'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, adicione a quantia a ser registrada';
                  }
                },
                onSaved: (amount) {
                  _record.amount = double.parse(amount);
                },
              ),
              TextFormField(
                initialValue: _record.description,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, adicione um valor para a descrição';
                  }
                },
                onSaved: (description) {
                  _record.description = description;
                },
              ),
              DateTimePickerFormField(
                initialValue: _record.date,
                inputType: InputType.date,
                format: DateFormat('yyyy-MM-dd'),
                editable: true,
                decoration: InputDecoration(
                    labelText: 'Data', hasFloatingPlaceholder: false),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione a data.';
                  }
                },
                onSaved: (date) {
                  _record.date = date;
                },
              ),
              SwitchListTile(
                title: Text(_record.isExpense ? 'Despesa' : 'Receita'),
                value: _record.isExpense,
                onChanged: (bool value) {
                  setState(() {
                    _record.isExpense = value;
                  });
                },
                secondary: Icon(Icons.attach_money),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submit,
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
