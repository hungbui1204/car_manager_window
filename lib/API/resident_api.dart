import 'dart:convert';
import 'package:car_manager_window/model/resident_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/services.dart';

Future<List<ResidentData>> fetchResidentData() async {
  final jsonData = await rootBundle.loadString('assets/json/resident_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => ResidentData.fromJson(e)).toList();
}

//  Stream<List<ResidentData>> readResidentData() {
//   var readAccount = FirebaseFirestore.instance
//       .collection('user_data')
//       .snapshots().map((snapshot) => snapshot.docs.map((doc) => ResidentData.fromJson(doc.data())).toList());
//   return readAccount;
// }
// Future<List<ResidentData>> getListResident() async{
//   var listResident = await readResidentData().first;
//   return listResident;
// }
// Future <List<ResidentData>> getListResidentData() async {
//   var snapshot = await FirebaseFirestore.instance.collection('user_data').get();
//   return snapshot.docs.map((e) => ResidentData.fromDocumentSnapshot(e)).toList();
// }
Future <List<ResidentData>> getListResidentData() async{
  var documents = await Firestore.instance.collection('user_data').get();
  return documents.map((document) {
    ResidentData listData = ResidentData.fromJson(Map<String, dynamic>.from(document.map));
    return listData;
  }).toList();
}