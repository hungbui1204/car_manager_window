import 'dart:convert';
import 'package:car_manager_window/model/guest_model.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/services.dart';

import '../InOut/test_get_data_firestore.dart';

// Future<List<GuestData>> fetchGuestData() async {
//   final jsonData = await rootBundle.loadString('assets/json/guest_data.json');
//   final listData = json.decode(jsonData) as List<dynamic>;
//   return listData.map((e) => GuestData.fromJson(e)).toList();
// }
Future <List<GuestData>> getListGuestData(bool searchUpToDown) async{
  var fireStore = Firestore(projectId);
  var documents = await fireStore.collection('guest_data').get();
  List<GuestData> guestList = [];
  documents.forEach((element) {
    guestList.add(GuestData.fromJson(element.map));
  });
  if(searchUpToDown){
    for (int step = 0; step < guestList.length; step++) {
      for (int i = 0; i < guestList.length - step - 1; i++) {
        if (guestList[i].timeIn.isBefore(guestList[i+1].timeIn)) {
          var temp = guestList[i];
          guestList[i] = guestList[i+1];
          guestList[i+1] = temp;
          print('up');
          print(guestList.first.number);

        }
      }
    }
  }else {
    for (int step = 0; step < guestList.length; step++) {
      for (int i = 0; i < guestList.length - step - 1; i++) {
        if (guestList[i].timeIn.isAfter(guestList[i+1].timeIn)) {
          var temp = guestList[i];
          guestList[i] = guestList[i+1];
          guestList[i+1] = temp;
          print(guestList.first.number);
          print('down');

        }
      }
    }
  }

  return guestList;
}
