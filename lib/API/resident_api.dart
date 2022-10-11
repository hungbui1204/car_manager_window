import 'dart:convert';
import 'package:car_manager_window/model/resident_model.dart';
import 'package:flutter/services.dart';

Future<List<ResidentData>> fetchResidentData() async {
  final jsonData = await rootBundle.loadString('assets/json/resident_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => ResidentData.fromJson(e)).toList();
}