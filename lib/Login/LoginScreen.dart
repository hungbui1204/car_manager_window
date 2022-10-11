import 'package:car_manager_window/API/account_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../model/account_model.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibility = false;
  bool hideTxt = true;
  bool userFocus = false;
  bool passwordFocus = false;
  List<Map<String,String>> account = [
    {
      'user': '1',
      'password': '1'
    },
    {
      'user': 'hung',
      'password': '123'
    }
  ];
  String? errorUsername(){
    String username = userController.value.text;
    if(username == '' && userFocus == true){
      return 'username is required';
    }else{
      return null;
    }
  }
  String? errorPassword(){
    String password = passwordController.value.text;
    if(password == '' && passwordFocus == true){
      return 'password is required';
    }else{
      return null;
    }
  }
  void displayErrorMotionToast() {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Login Failed'),
      animationType: AnimationType.fromBottom,
      position: MotionToastPosition.bottom,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
    ).show(context);
  }
  void displaySuccessMotionToast() {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text(
        'Login Successful',
        style: TextStyle(fontSize: 12),
      ),
      width: 300,
      height: 80,
      position: MotionToastPosition.bottom,
      animationType: AnimationType.fromBottom,
      dismissable: true,
    ).show(context);
  }
  Future<void> getAccount() async{
    var accountList = await fetchAccountData();
    for(int i = 0; i < accountList.length; i++){
      if(accountList[i].user == userController.value.text && accountList[i].password == passwordController.value.text){
        Get.offAllNamed('/home');
        displaySuccessMotionToast();
        break;
      }
      if(i == accountList.length -1){
        if(accountList[i].user != userController.value.text || accountList[i].password != passwordController.value.text){
          displayErrorMotionToast();
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(" Parking Manager",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      inherit: false,
                      color: Color.fromARGB(255, 31,20,86),
                      fontSize: 40
                  ),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 400,
                      width:400,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 201,247,243),
                        borderRadius: BorderRadius.all(Radius.circular(10))

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          const Center(
                            child: Text("Login",
                              style: TextStyle(
                                inherit: false,
                                color: Color.fromARGB(255, 31,20,86),
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ),),
                          ),
                          const SizedBox(height: 30,),
                          const Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text("Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  inherit: false,
                                  color: Color.fromARGB(255, 31,20,86),
                                  fontSize: 16
                              ),),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                              width: 350,
                              height: 80,
                              child: TextField (
                                onChanged: (value){
                                    if(userController.value.text == ''){
                                      setState(() {
                                        userFocus = true;
                                      });
                                    }else{
                                      setState(() {
                                        userFocus = false;
                                      });
                                    }
                                },
                                onTap: (){
                                  setState(() {
                                    userFocus = true;
                                  });
                                },
                                controller: userController,
                                cursorColor: const Color.fromARGB(255, 5,194,204),
                                decoration: InputDecoration(
                                  errorText: errorUsername(),
                                  fillColor: Colors.white,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                                    ),
                                    suffixIcon: const Icon(Icons.account_circle,color: Color.fromARGB(255, 5,194,204)),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                                    ),
                                    hintText: '@username',
                                ),
                              )),
                          const SizedBox(height: 20,),
                          const Padding(
                            padding: EdgeInsets.only(left: 50.0),
                            child: Text("Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  inherit: false,
                                  color: Color.fromARGB(255, 31,20,86),
                                  fontSize: 16
                              ),),
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                              width: 350,
                              height: 80,
                              child: TextField (
                                onChanged: (value){
                                  if(passwordController.value.text == ''){
                                    setState(() {
                                      passwordFocus = true;
                                    });
                                  }else{
                                    setState(() {
                                      passwordFocus = false;
                                    });
                                  }
                                },
                                onTap: (){
                                  setState(() {
                                    passwordFocus = true;
                                  });
                                },
                                obscureText: hideTxt,
                                cursorColor: const Color.fromARGB(255, 5,194,204),
                                controller: passwordController,
                                decoration: InputDecoration(
                                  errorText: errorPassword(),
                                  fillColor: Colors.white,
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        visibility =!visibility;
                                        hideTxt =!hideTxt;
                                      });
                                    },
                                    child: Icon(visibility?Icons.visibility_off:Icons.visibility, color: const Color.fromARGB(255, 5,194,204),),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                                  ),
                                  hintText: '@password',
                                ),
                              )),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                            height: 40,
                            width: 350,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 5,194,204)
                              ),
                                onPressed: (){
                                setState(() {
                                  userFocus = true;
                                  passwordFocus = true;
                                });
                                getAccount();
                                },
                                child: const Text('Login',
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                          )
                        ],
                      ),
                    ),
                    Image.asset('assets/images/car_login_img.png',scale: 2,fit: BoxFit.fill,)
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
