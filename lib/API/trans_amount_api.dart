import 'dart:convert';
import 'package:car_manager_window/model/amout_trans_model.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/services.dart';

Future<List<TransAmount>> fetchTransAmountData() async{
  final jsonData = await rootBundle.loadString('assets/json/amount_trans_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => TransAmount.fromJson(e)).toList();
}
Future <List<TransAmount>> getTransQuantity() async{
  var documents = await Firestore.instance.collection('statistic').get();
  var list = documents.map((document) {
    TransAmount listData = TransAmount.fromJson(Map<String, dynamic>.from(document.map));
    return listData;
  }).toList();
  for (int step = 0; step < list.length; step++) {
    for (int i = 0; i < list.length - step - 1; i++) {
      if (list[i].date.isAfter(list[i+1].date)) {
        var temp = list[i];
        list[i] = list[i+1];
        list[i+1] = temp;
      }
    }
  }
  return list;
}