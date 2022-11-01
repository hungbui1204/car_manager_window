import 'dart:io';

import 'package:flutter/material.dart';

import '../data/global_data.dart';

typedef ParseText = Function();

class DetailInOutWidget extends StatefulWidget {
  final screenWidth;
  final screenHeight;
  var image;
  final mode;
  final ParseText parseTheText;
  DetailInOutWidget(
      {Key? key,
      this.screenWidth,
      this.screenHeight,
      this.image,
      required this.parseTheText,
      this.mode})
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
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
              detail("Biển số", "61S26051"),
              detail("Loại xe", "WaveA"),
              detail("Thời gian ${widget.mode}", "XX/XX/XXXX")
            ],
          )),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: MaterialButton(
              height: widget.screenHeight,
              color: (widget.mode == "vào") ? Colors.green[200] : Colors.red[200],
              hoverColor: (widget.mode == "vào") ? Colors.green : Colors.red,
              onPressed: () {
                // widget.takePicture = !widget.takePicture;
                File('my_image.jpg').writeAsBytes(GlobalData.image.bytes);
                widget.image = File('my_image.jpg');
                // performImageLabeling();
                widget.parseTheText();
                setState(() {});
              },
              child: Text(
                (widget.mode == "vào") ? "ENTRANCE" : "EXIT",
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "Time New Roman",
                ),
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
        Text(
          data,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
      ],
    );
  }
}
