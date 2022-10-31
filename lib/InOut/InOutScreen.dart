import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import '../data/menu_items.dart';
import '../model/menu_item.dart';
class InOutScreen extends StatefulWidget {
  const InOutScreen({Key? key}) : super(key: key);

  @override
  State<InOutScreen> createState() => _InOutScreenState();
}

class _InOutScreenState extends State<InOutScreen> {
  late VlcPlayerController _videoPlayerController;
  Future<void> initializePlayer() async {}

  @override
  void initState() {
    super.initState();
    initializePlayer();
    _videoPlayerController = VlcPlayerController.network(
      'https://21.193.1.9:8081/video',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
  }

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
          Get.toNamed('/login');
          break;
      }
    }
    void managerOnSelected(BuildContext context, MenuItemm item){
      switch (item){
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
          backgroundColor: const Color.fromARGB(255, 5,194,204),
          actions:[
            Row(
              children: [
                const SizedBox(width: 20,),
                SizedBox(
                    height: 60,
                    width: 100,
                    child: TextButton(
                      onPressed: (){
                        Get.offAllNamed('/home');
                      },
                      style: OutlinedButton.styleFrom(),
                      child: Text('Home',style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal),),
                    )
                ),
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
                    child: TextButton(onPressed: (){},
                      style: OutlinedButton.styleFrom(

                      ),
                      child: Text('Statistic & Report',style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal),),
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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Row(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth*0.48,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: screenHeight*0.6,
                      width: screenWidth*0.48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                        ),
                      ),
                      // child: Image(
                      //   image: NetworkImage("https://192.168.32.69:8080"),
                      // ),
                      child: VlcPlayer(
                        controller: _videoPlayerController,
                        aspectRatio: 16/9,
                        placeholder: Center(child: CircularProgressIndicator(),),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: screenWidth*0.48,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              height: screenHeight,
              width: screenWidth*0.48,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(),
            ),
          ],
        ),
      )
    );
  }
}
