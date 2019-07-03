class Record {
  int id;
  String description;
  bool isExpense;
  double amount;
  DateTime date;

  Record(
      {this.id,
      this.description,
      this.isExpense = false,
      this.amount = 0,
      this.date});
}
