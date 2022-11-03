import 'dart:convert';
import 'package:car_manager_window/model/guest_model.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/services.dart';

Future<List<GuestData>> fetchGuestData() async {
  final jsonData = await rootBundle.loadString('assets/json/guest_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => GuestData.fromJson(e)).toList();
}
Future <List<GuestData>> getListGuestData() async{
  var documents = await Firestore.instance.collection('guest_data').get();
  return documents.map((document) {
    GuestData listData = GuestData.fromJson(Map<String, dynamic>.from(document.map));
    return listData;
  }).toList();
}