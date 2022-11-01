import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/global_data.dart';

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

  @override
  Widget build(BuildContext context) {
    if (recognize){
      recognize = (widget.plate != '') ? false : true;
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
              detail("Mã thẻ", "XXXXXXXXX"),
              detail("Chủ sở hữu", "Đinh Đức Lương"),
              detail("Biển số", widget.plate ?? ""),
              detail("Loại xe", "WaveA"),
              detail("Thời gian ${widget.mode}", "XX/XX/XXXX")
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
                // widget.takePicture = !widget.takePicture;
                setState(() {
                  recognize = true;
                });

                File('my_image.jpg').writeAsBytes(GlobalData.image.bytes);
                // widget.image = File('assets/train_text_recognize/2.jpg');
                // performImageLabeling();
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
