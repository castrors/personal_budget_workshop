class Record {
  String description;
  bool isExpense;
  double amount;
  DateTime date;

  Record({this.description, this.isExpense = false, this.amount, this.date});
}
