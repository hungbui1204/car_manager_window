import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../API/sales_data_api.dart';
import '../API/trans_amount_api.dart';
import '../data/menu_items.dart';
import '../model/amout_trans_model.dart';
import '../model/menu_item.dart';
import '../model/sales_data_model.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
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
                    child: TextButton(onPressed: (){
                      Get.offAllNamed('/home');
                    },
                      style: OutlinedButton.styleFrom(),
                      child: const Text('Home',style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal),),
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
      body: Column(
        children: [
          Container(
              height: screenHeight*0.4,
              width: screenWidth - 20,
              margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: FutureBuilder(
                  future: fetchTransAmountData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                    if(snapshot.hasData){
                      final data = snapshot.data as List<TransAmount>;
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          // Chart title
                          title: ChartTitle(text: 'Vehicle Quantity'),
                          //legend: Legend(isVisible: true),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<TransAmount, String>>[
                            LineSeries<TransAmount, String>(
                                dataSource: data,
                                xValueMapper: (TransAmount obj, _) => obj.day,
                                yValueMapper: (TransAmount obj, _) => obj.amount,
                                color: Colors.greenAccent,
                                name: 'Vehicle Quantity',
                                dataLabelSettings: DataLabelSettings(isVisible: true)
                            )]
                      );
                    }else if(snapshot.hasError){
                      return const Center(child: Text('Data Error'));
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,),);
                    }}
              )
          ),
          Container(
              height: screenHeight*0.4,
              width: screenWidth - 20,
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: FutureBuilder(
                  future: fetchSalesData(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                    if(snapshot.hasData){
                      final data = snapshot.data as List<SalesData>;
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          // Chart title
                          title: ChartTitle(text: 'Sales Data'),
                          //legend: Legend(isVisible: true),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<SalesData, String>>[
                            ColumnSeries<SalesData, String>(
                                dataSource: data,
                                xValueMapper: (SalesData obj, _) => obj.day,
                                yValueMapper: (SalesData obj, _) => obj.sales,
                                color: Colors.redAccent,
                                name: 'Sales Data',
                                dataLabelSettings: DataLabelSettings(isVisible: true)
                            )]
                      );
                    }else if(snapshot.hasError){
                      return const Center(child: Text('Data Error'));
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,),);
                    }}
              )
          ),
        ],
      )
    );
  }
}
