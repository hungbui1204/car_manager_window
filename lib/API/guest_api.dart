import 'dart:convert';
import 'package:car_manager_window/model/guest_model.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/services.dart';

// Future<List<GuestData>> fetchGuestData() async {
//   final jsonData = await rootBundle.loadString('assets/json/guest_data.json');
//   final listData = json.decode(jsonData) as List<dynamic>;
//   return listData.map((e) => GuestData.fromJson(e)).toList();
// }
Future <List<GuestData>> getListGuestData(bool searchUpToDown, bool searchDownToUp) async{
  var documents = await Firestore.instance.collection('guest_data').get();
  var list = documents.map((document) {
    GuestData listData = GuestData.fromJson(Map<String, dynamic>.from(document.map));
    return listData;
  }).toList();
  if(searchUpToDown == true && searchDownToUp == false){
    for (int step = 0; step < list.length; step++) {
      for (int i = 0; i < list.length - step - 1; i++) {
        if (list[i].timeIn.isBefore(list[i+1].timeIn)) {
          var temp = list[i];
          list[i] = list[i+1];
          list[i+1] = temp;
        }
      }
    }
  }else if(searchUpToDown == false && searchDownToUp == true){
    for (int step = 0; step < list.length; step++) {
      for (int i = 0; i < list.length - step - 1; i++) {
        if (list[i].timeIn.isAfter(list[i+1].timeIn)) {
          var temp = list[i];
          list[i] = list[i+1];
          list[i+1] = temp;
        }
      }
    }
  }
  return list;
}
