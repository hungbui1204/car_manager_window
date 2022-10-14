import 'package:car_manager_window/CardManager/GuestCardScreen.dart';
import 'package:car_manager_window/CardManager/ResidentCardScreen.dart';
import 'package:car_manager_window/Home/HomeScreen.dart';
import 'package:car_manager_window/InOut/InOutScreen.dart';
import 'package:car_manager_window/Setting/SettingScreen.dart';
import 'package:car_manager_window/Statistic/StatisticScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login/LoginScreen.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
// Future main() async{
//   await Firebase.initializeApp(
//       options:  DefaultFirebaseOptions.android);
//   return runApp(const MyApp());
// }
void main(){
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: ()=> const LoginScreen(),transition: Transition.leftToRight),
        GetPage(name: '/home', page: ()=>const HomeScreen(), transition: Transition.leftToRight),
        GetPage(name: '/setting', page: ()=> const SettingScreen(), transition: Transition.leftToRight),
        GetPage(name: '/inout', page:()=> const InOutScreen(), transition: Transition.leftToRight),
        GetPage(name: '/resident', page: ()=> const ResidentCardScreen(), transition: Transition.leftToRight),
        GetPage(name: '/guest', page: ()=> const GuestCardScreen(), transition: Transition.leftToRight),
        GetPage(name: '/statistic', page: () => const StatisticScreen(), transition:  Transition.leftToRight)
      ],
    );
  }
}

