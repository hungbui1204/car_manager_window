import 'dart:convert';
import 'dart:io';
import 'package:car_manager_window/items/detail_inout.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:car_manager_window/InOut/preprocessor_frame.dart';
import 'package:car_manager_window/data/global_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/menu_items.dart';
import '../model/menu_item.dart';

class InOutScreen extends StatefulWidget {
  const InOutScreen({Key? key}) : super(key: key);

  @override
  State<InOutScreen> createState() => _InOutScreenState();
}

class _InOutScreenState extends State<InOutScreen> {
  String result = '';
  bool takePicture = false;
  File? image ;

  // Another option which doesn't work as expected is commented.

  // performImageLabeling() async{
  //   final GoogleVisionImage firebaseVisionImage = GoogleVisionImage.fromFile(image!);
  //   final TextRecognizer textRecognizer = GoogleVision.instance.textRecognizer();
  //   VisionText visionText = await textRecognizer.processImage(firebaseVisionImage);
  //
  //   result = '';
  //   String? text = visionText.text;
  //   setState(() {
  //
  //     for (TextBlock block in visionText.blocks){
  //       final Rect? boundingBox = block.boundingBox;
  //       final List<Offset> cornerPoints = block.cornerPoints;
  //       final String? text = block.text;
  //       final List<RecognizedLanguage> languages = block.recognizedLanguages;
  //       for(TextLine line in block.lines){
  //         for (TextElement element in line.elements){
  //           result += "${element.text} ";
  //         }
  //       }
  //       result += "\n\n";
  //     }
  //   });
  // }

  String parsedtext = '';
  parsethetext() async {
    var bytes = GlobalData.image.bytes;
    // parsedtext = '';
    // var bytes = File("assets/train_text_recognize/13.jpg").readAsBytesSync();

    String img64 = base64Encode(bytes);
    var url = 'https://api.ocr.space/parse/image';
    var payload = {"base64Image": "data:image/jpg;base64,${img64.toString()}"};
    var header = {"apikey": "K85183784788957"};
    var post = await http.post(Uri.parse(url), body: payload, headers: header);
    var result = jsonDecode(post.body);
    setState(() {
      parsedtext = result['ParsedResults'][0]['ParsedText'];
      parsedtext = parsedtext.replaceAll("\n", ' ');
      parsedtext = parsedtext.replaceAll("\r", "");
      print(parsedtext);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    PopupMenuItem<MenuItemm> buildItem(MenuItemm item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(
              item.icon,
              color: Colors.black,
            ),
            Text(item.text),
          ],
        ));
    void systemOnSelected(BuildContext context, MenuItemm item) {
      switch (item) {
        case MenuItems.itemSettings:
          Get.toNamed('/setting');
          break;

        case MenuItems.itemExit:
          Get.toNamed('/login');
          break;
      }
    }

    void managerOnSelected(BuildContext context, MenuItemm item) {
      switch (item) {
        case MenuItems.itemInOut:
          break;
        case MenuItems.itemResidentCard:
          break;
        case MenuItems.itemGuestCard:
          break;
      }
    }

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: const Color.fromARGB(255, 5, 194, 204),
            actions: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                      height: 60,
                      width: 100,
                      child: TextButton(
                        onPressed: () {
                          Get.offAllNamed('/home');
                        },
                        style: OutlinedButton.styleFrom(),
                        child: const Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      )),
                  SizedBox(
                      height: 60,
                      width: 200,
                      child: PopupMenuButton<MenuItemm>(
                        child: const Center(
                            child: Text(
                          'In/Out Manager',
                          style: TextStyle(fontSize: 22),
                        )),
                        onSelected: (item) => managerOnSelected(context, item),
                        itemBuilder: (context) => [
                          ...MenuItems.itemInOutManager.map(buildItem).toList(),
                        ],
                      )),
                  SizedBox(
                      height: 60,
                      width: 220,
                      child: TextButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(),
                        child: const Text(
                          'Statistic & Report',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      )),
                  SizedBox(
                      height: 60,
                      width: 140,
                      child: PopupMenuButton<MenuItemm>(
                        child: const Center(
                            child: Text(
                          'System',
                          style: TextStyle(fontSize: 22),
                        )),
                        onSelected: (item) => systemOnSelected(context, item),
                        itemBuilder: (context) => [
                          ...MenuItems.itemSystem.map(buildItem).toList(),
                        ],
                      )),
                ],
              ),
              const Expanded(child: SizedBox()),
            ]),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                height: screenHeight,
                width: screenWidth * 0.48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.all(10),
                          height: screenHeight * 0.6,
                          width: screenWidth * 0.48,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          // child: Image(
                          //   image: NetworkImage("https://192.168.32.69:8080"),
                          // ),
                          child: MyMjpeg(
                            isLive: true,
                            
                            fit: BoxFit.cover,
                            error: (context, error, stack) {
                              return Text(error.toString(),
                                  style: const TextStyle(color: Colors.red));
                            },
                            stream: 'http://10.15.223.205:1024/video',
                            takePicture: takePicture,
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: DetailInOutWidget(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        parseTheText: parsethetext,
                        mode: "vào",
                        plate: parsedtext,
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                height: screenHeight,
                width: screenWidth * 0.48,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                          height: screenHeight * 0.6,
                          width: screenWidth * 0.48,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          // child: MyMjpeg(
                          //   isLive: true,
                          //   error: (context, error, stack) {
                          //     return Text(error.toString(),
                          //         style: const TextStyle(color: Colors.red));
                          //   },
                          //   stream: 'http://10.15.223.205:1024/video',
                          //   takePicture: takePicture,
                          // )
                        ),
                    ),
                    Expanded(
                      flex: 2,
                      child: DetailInOutWidget(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        parseTheText: parsethetext,
                        mode: "ra",
                        plate: parsedtext,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
