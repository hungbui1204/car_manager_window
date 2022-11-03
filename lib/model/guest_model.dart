class GuestData {
  String? id;
  String? type;
  String? number;
  DateTime timeIn = DateTime.now();

  GuestData({this.id, this.type, this.number, required this.timeIn});

  GuestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    number = json['number'];
    timeIn = DateTime.parse(json['time_in'].toString());
  }
}
