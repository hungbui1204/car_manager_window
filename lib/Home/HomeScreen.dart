import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/menu_items.dart';
import '../model/menu_item.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String txt = '';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    PopupMenuItem<MenuItemm> buildItem(MenuItemm item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon,color: Colors.black,),
            Text(item.text),
          ],
        ));
    void systemOnSelected(BuildContext context, MenuItemm item){
      switch (item){
        case MenuItems.itemSettings:
          Get.toNamed('/setting');
          break;

        case MenuItems.itemExit:
          Get.offAllNamed('/login');
          break;
      }
    }
    void managerOnSelected(BuildContext context, MenuItemm item){
      switch (item){
        case MenuItems.itemInOut:
          Get.offAllNamed('/inout');
          break;
        case MenuItems.itemResidentCard:
          Get.toNamed('/resident');
          break;
        case MenuItems.itemGuestCard:
          Get.toNamed('/guest');
          break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 5,194,204),
        actions:[
          Row(
            children: [
              const SizedBox(width: 20,),
              SizedBox(
                  height: 60,
                  width: 200,
                  child: PopupMenuButton<MenuItemm>(
                    child: const Center(child: Text('In/Out Manager', style: TextStyle(fontSize: 22),)),
                    onSelected: (item)=>managerOnSelected(context, item),
                    itemBuilder: (context)=>[
                      ...MenuItems.itemInOutManager.map(buildItem).toList(),
                    ],
                  )
              ),
              SizedBox(
                  height: 60,
                  width: 220,
                  child: TextButton(onPressed: (){
                    Get.offAllNamed('/statistic');
                  },
                    style: OutlinedButton.styleFrom(),
                    child: const Text('Statistic & Report',style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal),),
                  )
              ),
              SizedBox(
                height: 60,
                width: 140,
                child: PopupMenuButton<MenuItemm>(
                  child: const Center(child: Text('System', style: TextStyle(fontSize: 22),)),
                  onSelected: (item)=>systemOnSelected(context, item),
                  itemBuilder: (context)=>[
                    ...MenuItems.itemSystem.map(buildItem).toList(),
                  ],
                )
              ),

            ],
          ),
          const Expanded(child: SizedBox()),
        ]
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.white,
          ),
          Image.asset('assets/images/background3.jpg'),
          Column(
            children: [
              Text('Home', style: TextStyle(
                color: const Color.fromARGB(255, 5,194,204),
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: screenWidth*0.25,
                          height: screenHeight*0.75,
                          margin: EdgeInsets.only(left: 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 255,255,255)
                          ),
                          child: Image.asset('assets/images/instruction.jpg'),
                        ),
                        TextButton(onPressed: (){}, child: Container(
                          width: screenWidth*0.25,
                          height: screenHeight*0.75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: const Color.fromARGB(120, 0,0,0)
                          ),
                          child: Center(
                            child: Text('HOW TO USE THIS APP? JUST CLICK HERE!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(220, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),),
                          ),
                        ),),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: screenWidth*0.25,
                          height: screenHeight*0.75,
                          margin: EdgeInsets.only(left: 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 255,255,255)
                          ),
                          child: Image.asset('assets/images/customer_care.jpg'),
                        ),
                        TextButton(onPressed: (){}, child: Container(
                          width: screenWidth*0.25,
                          height: screenHeight*0.75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: const Color.fromARGB(120, 0,0,0)
                          ),
                          child: Center(
                            child: Text('ABOUT CUSTOMER CARE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(220, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),),
                          ),
                        ),),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: screenWidth*0.25,
                          height: screenHeight*0.75,
                          margin: EdgeInsets.only(left: 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 255,255,255)
                          ),
                          child: Image.asset('assets/images/update.jpg'),
                        ),
                        TextButton(onPressed: (){}, child: Container(
                          width: screenWidth*0.25,
                          height: screenHeight*0.75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: const Color.fromARGB(120, 0,0,0)
                          ),
                          child: Center(
                            child: Text('NEW FEATURES IN THE NEXT UPDATE!!!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(220, 255, 255, 255),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),),
                          ),
                        ),),
                      ],
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: Column(
                    //     children: [
                    //       Stack(
                    //         children: [
                    //           Container(
                    //             height: 100,
                    //             color: const Color.fromARGB(255, 5,194,204),
                    //           ),
                    //            Container(
                    //              padding: const EdgeInsets.only(top: 25),
                    //               alignment: Alignment.center,
                    //               child: const Text('HOME',
                    //               style: TextStyle(
                    //                 fontSize: 35,
                    //                 color: Colors.white
                    //               ),
                    //               )),
                    //         ],
                    //       ),
                    //     ],
                    //   )
                    // ),
                    // Expanded(
                    //     flex: 5,
                    //     child: Image.asset('assets/images/background1.jpg'))
                  ],
                ),
              ),
            ],
          ),
          // ScrollLoopAutoScroll(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       Image.asset('assets/images/speaker.png',scale: 10,),
          //       const SizedBox(width: 10,),
          //       const Text(
          //         'Important notification: We will have a big card system update next month, please inform to our resident as soon as possible!!!',
          //         style: TextStyle(fontSize: 20),
          //       )
          //     ],
          //   ),
          // ),
        ],
      )
    );

  }
}