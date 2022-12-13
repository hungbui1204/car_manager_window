import 'dart:convert';
import 'package:car_manager_window/model/account_model.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/services.dart';

Future<List<Account>> fetchAccountData() async {
  final jsonData = await rootBundle.loadString('assets/json/account.json');
  final listData = json.decode(jsonData) as List<dynamic>;
  return listData.map((e) => Account.fromJson(e)).toList();
}
Future<List<Account>> getAccountData() async{
var documents = await Firestore.instance.collection('admin_account').get();
var list = documents.map((document) {
  Account accountData = Account.fromJson(Map<String, dynamic>.from(document.map));
  return accountData;
}).toList();
return list;
}