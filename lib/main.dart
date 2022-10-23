import 'package:car_manager_window/CardManager/GuestCardScreen.dart';
import 'package:car_manager_window/CardManager/ResidentCardScreen.dart';
import 'package:car_manager_window/Home/HomeScreen.dart';
import 'package:car_manager_window/InOut/InOutScreen.dart';
import 'package:car_manager_window/Setting/SettingScreen.dart';
import 'package:car_manager_window/Statistic/StatisticScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'Login/LoginScreen.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

const apiKey = "AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E";
const authDomain = "flutter-car-manager-mobile.firebaseapp.com";
const databaseURL = "https://flutter-car-manager-mobile-default-rtdb.asia-southeast1.firebasedatabase.app";
const projectId = "flutter-car-manager-mobile";
const storageBucket = "flutter-car-manager-mobile.appspot.com";
const messagingSenderId = "387750916082";
const appId = "1:387750916082:web:01ee70eff0036b9289056b";


// Future main() async{
//
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //     options:  DefaultFirebaseOptions.web);
//   await Firebase.initializeApp(
//       options: const FirebaseOptions(
//           apiKey: "AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E",
//           projectId: "flutter-car-manager-mobile",
//           messagingSenderId: "387750916082",
//           appId: "1:387750916082:web:01ee70eff0036b9289056b"
//       ));
//   return runApp(const MyApp());
// }
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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

