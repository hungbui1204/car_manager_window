class ResidentData {
  String? id;
  String? name;
  String? type;
  String? number;
  String? timeIn;

  ResidentData({this.id, this.name, this.type, this.number, this.timeIn});

  ResidentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    number = json['number'];
    timeIn = json['time_in'];
  }
}
