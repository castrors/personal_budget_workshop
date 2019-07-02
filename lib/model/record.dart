
import 'package:meta/meta.dart';

class Record {

  String description;
  bool completed;
  double amount;
  DateTime date;

  Record({@required this.description, this.completed = false, @required this.amount, this.date});
}