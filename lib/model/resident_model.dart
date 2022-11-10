import 'package:cloud_firestore/cloud_firestore.dart';

class ResidentData {
  String? id;
  String? name;
  String? type;
  String? number;
  List history = [];

  ResidentData({this.id, this.name, this.type, this.number, required this.history});

  ResidentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    number = json['number'];
    history = json['history'];
  }

//   ResidentData.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
//       : id = doc.id,
//         name = doc.data()!["name"],
//         type = doc.data()!["type"],
//         number = doc.data()!["number"],
//         timeIn = doc.data()!["time_in"];
 }

