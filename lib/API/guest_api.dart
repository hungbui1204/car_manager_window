import 'dart:convert';
import 'package:car_manager_window/model/guest_model.dart';
import 'package:flutter/services.dart';

Future<List<GuestData>> fetchGuestData() async {
  final jsonData = await rootBundle.loadString('assets/json/guest_data.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => GuestData.fromJson(e)).toList();
}