
import 'dart:convert';

import 'package:firebase_dart/firebase_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

const apiKey = 'AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E';
const projectId = 'flutter-car-manager-mobile';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


void main() async{
  // Firestore.initialize(projectId);
  // var firestore = Firestore(projectId);

  FirebaseDart.setup();
  var app = await Firebase.initializeApp(
    options: const FirebaseOptions(
        appId: '1:387750916082:web:01ee70eff0036b9289056b',
        apiKey: 'AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E',
        projectId: 'flutter-car-manager-mobile',
        messagingSenderId: '387750916082',
        authDomain: 'flutter-car-manager-mobile.firebaseapp.com',
        storageBucket: 'flutter-car-manager-mobile.appspot.com',

        databaseURL: 'https://flutter-car-manager-mobile-default-rtdb.asia-southeast1.firebasedatabase.app')
  );

  // Test get all data in collection
  //
  // var ref = await firestore.collection('user_data').get();

  // var reference = await firestore.document(ref[2].path).get();
  // if (reference['id']=="19119195"){
  //   print("deo ok");
  // }
  // else  print("Cung ok");
  // // ref.stream.listen((document) => print('name: $document'));

  //Use .where to find path
  //
  // var ref = await firestore.collection('user_data').where('id', isEqualTo: "19119195").get();
  // var refe = await firestore.document(ref.first.path).get();
  // var his = refe['history'];

  //Test add and update field in firestore
  //
  // firestore.document(ref.first.path).update(
  //     {'history': [his[0], dateformat]});
  // await refe.create({'historys': '00:00:00'});

  // Test Format DateTime
  //
  // DateTime date = DateTime.now();
  // print(date);
  // String dateformat = DateFormat('HH:mm:ss dd/M/yy').format(date);
  // print(dateformat);

  // Test Storage Firebase
  try{
    var storage = FirebaseStorage.instanceFor(app: app);
    // add file test.txt to storage
    //
    var ref = storage.ref().child('test.txt');

    // add data to file test.txt
    //
    await ref.putString('hello world!',
        metadata: SettableMetadata(contentType: 'text/plain'));

    // get type of file test.txt
    //
    var m = await ref.getMetadata();
    print('content type of file test.txt: ${m.contentType}');

    // read data of file test.txt
    //
    print(utf8.decode((await ref.getData())!));

    // add with address folder...
    //
    ref = storage.ref().child('test2.txt');
    await ref.putString('hello world!1',
        metadata: SettableMetadata(contentType: 'text/plain'));

    // add picture
    // ;
    File pic = File("assets/train_text_recognize/1.jpg");
    Uint8List picU = await pic.readAsBytes();
    ref = storage.ref().child('test2.png');
    await ref.putData(picU);

  }
  catch(e){
    throw e;
  }
}