import 'package:intl/intl.dart';

class GuestData {
  String? id;
  String? name;
  String? number;
  DateTime timeIn = DateTime.now();

  GuestData({this.id, this.name, this.number, required this.timeIn});

  GuestData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    number = json['number'] ?? '';
    timeIn = DateFormat("HH:mm:ss dd-M-yy").parse(json['time_in']);
    // timeIn = DateTime.parse(json['time_in'].toString());

    // return GuestData(timeIn: timeIn)
  }

}
