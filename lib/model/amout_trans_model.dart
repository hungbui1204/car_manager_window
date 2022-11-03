import 'package:intl/intl.dart';

class TransAmount {
  DateTime date = DateTime.now();
  int? quantity;

  TransAmount({required this.date, this.quantity});

  TransAmount.fromJson(Map<String, dynamic> json) {
    // day = json['day'];
    date = DateTime.parse(json['day'].toString());
    quantity = int.parse(json['quantity'].toString());
  }
}