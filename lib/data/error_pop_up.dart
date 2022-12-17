import 'package:flutter/material.dart';

Dialog errorLicensePlateIn(context){
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: SizedBox(
      height: 150.0,
      width: 300.0,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 30,
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Image(
                    image: AssetImage('assets/images/warning.png'),
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Text(
                        'Your car was existed in the parking. Please present vehicle documents to continue!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    elevation: MaterialStateProperty.all(8),),
                child: const Text(
                  'Got It!',
                  style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ),
  );
}

Dialog errorLicensePlateOut(context){
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: SizedBox(
      height: 150.0,
      width: 300.0,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 30,
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Image(
                    image: AssetImage('assets/images/warning.png'),
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Text(
                        'Your car wasn\'t existed in the parking. Please present vehicle documents to continue!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(8),),
                child: const Text(
                  'Got It!',
                  style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ),
  );
}


Dialog errorPlate(context){
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: SizedBox(
      height: 150.0,
      width: 300.0,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 30,
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Image(
                    image: AssetImage('assets/images/warning.png'),
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Text(
                        'This plate is invalid. Please check your plate again!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(8),),
                child: const Text(
                  'Got It!',
                  style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ),
  );
}