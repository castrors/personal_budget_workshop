import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:personal_budget_workshop/model/record.dart';
import 'package:personal_budget_workshop/provider/record_provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddRecordScreen extends StatefulWidget {
  final Record record;
  
  AddRecordScreen({this.record});
  @override
  _AddRecordScreenState createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  final _formKey = GlobalKey<FormState>();
  Record _record;

  @override
  void initState() {
    super.initState();
    _record = widget.record;
  }

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<RecordProvider>(context, listen: false).addRecord(_record);
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
                key: Key("record_amount"),
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                decoration: InputDecoration(labelText: 'Valor'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, adicione a quantia a ser registrada';
                  }
                },
                onSaved: (amount){
                  _record.amount = double.parse(amount);
                },
              ),
              TextFormField(
                key: Key("record_description"),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, adicione um valor para a descrição';
                  }
                },
                onSaved: (description){
                  _record.description = description;
                },
              ),
              DateTimePickerFormField(
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
                title: Text(_record.isExpense? 'Despesa' : 'Receita'),
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
        child: Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
