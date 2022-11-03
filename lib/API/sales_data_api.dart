import 'dart:convert';
import 'package:car_manager_window/model/sales_data_model.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/services.dart';

Future<List<SalesData>> fetchSalesData() async{
  final jsonData = await rootBundle.loadString('assets/json/sales_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => SalesData.fromJson(e)).toList();
}
Future <List<SalesData>> getSalesData() async{
  var documents = await Firestore.instance.collection('statistic').get();
  var list = documents.map((document) {
    SalesData listData = SalesData.fromJson(Map<String, dynamic>.from(document.map));
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