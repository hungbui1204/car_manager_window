class GuestData {
  String? id;
  String? type;
  String? number;
  String? timeIn;

  GuestData({this.id, this.type, this.number, this.timeIn});

  GuestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    number = json['number'];
    timeIn = json['time_in'];
  }
}
