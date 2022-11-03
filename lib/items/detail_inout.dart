import 'dart:io';
import 'dart:typed_data';

import 'package:firedart/firedart.dart';
import 'package:firebase_dart/firebase_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/global_data.dart';
const apiKey = 'AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E';
const projectId = 'flutter-car-manager-mobile';

typedef ParseText = Function();

class DetailInOutWidget extends StatefulWidget {
  final screenWidth;
  final screenHeight;
  var image;
  final mode;
  var plate;
  final ParseText parseTheText;
  DetailInOutWidget(
      {Key? key,
      this.screenWidth,
      this.screenHeight,
      this.image,
      required this.parseTheText,
      this.mode, this.plate})
      : super(key: key);

  @override
  _DetailInOutWidgetState createState() => _DetailInOutWidgetState();
}

class _DetailInOutWidgetState extends State<DetailInOutWidget> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget.takePicture = false;
  // }
  bool recognize = false;
  String id ='';
  String name = '';
  String time_in = '';
  String type = '';

  ImportImageFirebaseStorage(String path, String name) async{
    // FirebaseDart.setup();
    // var app = await Firebase.initializeApp(
    //     options: const FirebaseOptions(
    //         appId: '1:387750916082:web:01ee70eff0036b9289056b',
    //         apiKey: 'AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E',
    //         projectId: 'flutter-car-manager-mobile',
    //         messagingSenderId: '387750916082',
    //         authDomain: 'flutter-car-manager-mobile.firebaseapp.com',
    //         storageBucket: 'flutter-car-manager-mobile.appspot.com')
    // );
    var storage = FirebaseStorage.instance;
    File pic = File("assets/train_text_recognize/1.jpg");
    Uint8List picU = await pic.readAsBytes();
    var ref = storage.ref().child('$path/$name.jpg');
    await ref.putData(picU);
  }


  String GetDateTime(){
    DateTime date = DateTime.now();
    String dateformat = DateFormat('HH:mm:ss dd-M-yy').format(date);
    return dateformat;
  }

  List<String> HistoryParking(List data){
    List<String> history = [];
    data.forEach((element) {
      history.add(element);
    });
    return history;
  }

  Future GetData(String plate) async{

    var firestore = Firestore(projectId);
    var ref = await firestore.collection('user_data').where('number', isEqualTo: plate).get();
    var data = await firestore.document(ref.first.path).get();
    var history = HistoryParking(data['history']);
    id = data['id'];
    name = data['name'];
    time_in = GetDateTime();
    var time = widget.mode == "vào" ? "IN $time_in" : "OUT $time_in";
    // var time = 'IN 00:00:00 10-10-22';
    history.add(time);
    firestore.document(ref.first.path).update(
        {'history': history});
    type = data['type'];
    ImportImageFirebaseStorage(ref.first.path, time);
    setState(() {

    });
  }

  // void displaySuccessMotionToast() {
  //   MotionToast.success(
  //     title: const Text(
  //       'Success',
  //       style: TextStyle(fontWeight: FontWeight.bold),
  //     ),
  //     description: const Text(
  //       'Login Successful',
  //       style: TextStyle(fontSize: 12),
  //     ),
  //     width: 300,
  //     height: 80,
  //     position: MotionToastPosition.bottom,
  //     animationType: AnimationType.fromBottom,
  //     dismissable: true,
  //   ).show(context);
  // }

  @override
  Widget build(BuildContext context) {
    if (recognize){
      recognize = (widget.plate != '') ? false : true;
      if (widget.plate!=''){
        GetData(widget.plate);
      }

    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: widget.screenWidth * 0.48,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              detail("Mã thẻ", "$id"),
              detail("Chủ sở hữu", "$name"),
              detail("Biển số", widget.plate ?? ""),
              detail("Loại xe", "$type"),
              detail("Thời gian ${widget.mode}", "$time_in")
            ],
          )),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: MaterialButton(
              height: widget.screenHeight,
              color: (widget.mode == "vào") ? Colors.green[200] : Colors.red[200],
              hoverColor: (widget.mode == "vào") ? Colors.green : Colors.red,
              onPressed: () async {
                widget.plate = '';
                id ='';
                name = '';
                time_in = '';
                type = '';
                // widget.takePicture = !widget.takePicture;
                setState(() {
                  recognize = true;
                });
                File('my_image.jpg').writeAsBytes(GlobalData.image.bytes);
                widget.parseTheText();
              },
              child: (!recognize) ? Text(
                (widget.mode == "vào") ? "ENTRANCE" : "EXIT",
                style: TextStyle(
                  color: (widget.mode == "vào") ? Colors.brown : Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "Time New Roman",
                ),
              ) :  CircularProgressIndicator(
                color: (widget.mode == "vào") ? Colors.brown : Colors.white70,
                strokeWidth: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget detail(String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 15,),
        Expanded(
          child: Text(
            data,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
        ),
      ],
    );
  }
}
