import 'dart:convert';
import 'package:car_manager_window/model/amout_trans_model.dart';
import 'package:flutter/services.dart';

Future<List<TransAmount>> fetchTransAmountData() async{
  final jsonData = await rootBundle.loadString('assets/json/amount_trans_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => TransAmount.fromJson(e)).toList();
}
