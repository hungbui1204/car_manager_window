import 'dart:convert';
import 'package:car_manager_window/model/datetime_model.dart';
import 'package:car_manager_window/model/resident_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
// Future<List<ResidentData>> fetchResidentData() async {
//   final jsonData = await rootBundle.loadString('assets/json/resident_data.json');
//   final listData = json.decode(jsonData) as List<dynamic>;
//   return listData.map((e) => ResidentData.fromJson(e)).toList();
// }
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
Future <List<ResidentData>> getListResidentData(bool searchUpToDown, bool searchDownToUp) async{
  List<DateTime> listDate = [];
  String year, month, day, hour, minute, second;
  String state;
  DateTime date = DateTime.now();
  var documents = await Firestore.instance.collection('user_data').get();
  var list = documents.map((document) {
    ResidentData listData = ResidentData.fromJson(Map<String, dynamic>.from(document.map));
    return listData;
  }).toList();
  for(int i = 0; i < list.length; i++){
    state = list[i].history.last.split(' ')[0];
    year = '20${list[i].history.last.split(' ')[2].split('-')[2]}';
    month = list[i].history.last.split(' ')[2].split('-')[1];
    day = list[i].history.last.split(' ')[2].split('-')[0];
    hour = list[i].history.last.split(' ')[1].split(':')[0];
    minute = list[i].history.last.split(' ')[1].split(':')[1];
    second = list[i].history.last.split(' ')[1].split(':')[2];
    date = DateTimeMoment.toDateTime(DateTimeMoment(year, month, day, hour, minute, second));
    list[i].history.last = '${DateFormat('dd/MM/yy HH:mm:ss').format(date)} ($state)';
    listDate.add(date);
  }
  print(listDate);
  if(searchUpToDown == true && searchDownToUp == false){
    for (int step = 0; step < list.length; step++) {
      for (int i = 0; i < list.length - step - 1; i++) {
        if (listDate[i].isBefore(listDate[i+1])) {
          var temp1 = list[i];
          list[i] = list[i+1];
          list[i+1] = temp1;
          var temp2 = listDate[i];
          listDate[i] = listDate[i+1];
          listDate[i+1] = temp2;
        }
      }
    }
  }else if(searchUpToDown == false && searchDownToUp == true){
    for (int step = 0; step < list.length; step++) {
      for (int i = 0; i < list.length - step - 1; i++) {
        if (listDate[i].isAfter(listDate[i+1])) {
          var temp1 = list[i];
          list[i] = list[i+1];
          list[i+1] = temp1;
          var temp2 = listDate[i];
          listDate[i] = listDate[i+1];
          listDate[i+1] = temp2;
        }
      }
    }
  }
  return list;
}