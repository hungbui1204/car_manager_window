class TransAmount {
  String? day;
  int? amount;

  TransAmount({this.day, this.amount});

  TransAmount.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    amount = json['amount'];
  }
}