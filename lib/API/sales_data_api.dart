import 'dart:convert';
import 'package:car_manager_window/model/sales_data_model.dart';
import 'package:flutter/services.dart';

Future<List<SalesData>> fetchSalesData() async{
  final jsonData = await rootBundle.loadString('assets/json/sales_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => SalesData.fromJson(e)).toList();
}
