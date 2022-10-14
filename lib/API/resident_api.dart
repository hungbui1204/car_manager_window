import 'dart:convert';
import 'package:car_manager_window/model/resident_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

Future<List<ResidentData>> fetchResidentData() async {
  final jsonData = await rootBundle.loadString('assets/json/resident_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => ResidentData.fromJson(e)).toList();
}

 Stream<List<ResidentData>> readResidentData() {
  var readAccount = FirebaseFirestore.instance
      .collection('user_data')
      .snapshots().map((snapshot) => snapshot.docs.map((doc) => ResidentData.fromJson(doc.data())).toList());
  return readAccount;
}
Future<List<ResidentData>> getListResident() async{
  var listResident = await readResidentData().first;
  return listResident;
}