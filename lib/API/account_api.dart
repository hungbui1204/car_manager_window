import 'dart:convert';
import 'package:car_manager_window/model/account_model.dart';
import 'package:flutter/services.dart';

Future<List<Account>> fetchAccountData() async {
  final jsonData = await rootBundle.loadString('assets/json/account.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => Account.fromJson(e)).toList();
}