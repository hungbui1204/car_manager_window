import 'package:car_manager_window/model/resident_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:car_manager_window/data/resident_data_grid_source.dart';
import 'package:car_manager_window/API/resident_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResidentCardScreen extends StatefulWidget {
  const ResidentCardScreen({Key? key}) : super(key: key);
  @override
  State<ResidentCardScreen> createState() => _ResidentCardScreenState();
}

class _ResidentCardScreenState extends State<ResidentCardScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController transportController = TextEditingController();
  bool search = false;
  bool searchUpToDown = false;
  bool searchDownToUp = false;
  Future<ResidentDataSource> getResidentDataSource() async {
    var residentList = await getListResidentData(searchUpToDown, searchDownToUp);
    List<ResidentData> residentSearch = [];
    for(var i in residentList){
      if(idController.value.text == i.id
          && numberController.value.text ==''
          && nameController.value.text == ''
          && transportController.value.text == ''){
        residentSearch.add(i);
      }else if(idController.value.text == i.id
          && numberController.value.text == i.number
          && nameController.value.text == ''
          && transportController.value.text == ''){
        residentSearch.add(i);
      }else if(idController.value.text == i.id
          && numberController.value.text == i.number
          && nameController.value.text == i.name
          && transportController.value.text == ''){
        residentSearch.add(i);
      }else if(idController.value.text == i.id
          && numberController.value.text == i.number
          && nameController.value.text == i.name
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }else if(idController.value.text == ''
          && numberController.value.text == i.number
          && nameController.value.text == ''
          && transportController.value.text == ''){
        residentSearch.add(i);
      }else if(idController.value.text == ''
          && numberController.value.text == i.number
          && nameController.value.text == i.name
          && transportController.value.text == ''){
        residentSearch.add(i);
      }else if(idController.value.text == ''
          && numberController.value.text == i.number
          && nameController.value.text == i.name
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }else if(idController.value.text == ''
          && numberController.value.text == ''
          && nameController.value.text == i.name
          && transportController.value.text == ''){
        residentSearch.add(i);
      }else if(idController.value.text == ''
          && numberController.value.text == ''
          && nameController.value.text == i.name
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }else if(idController.value.text == i.id
          && numberController.value.text == ''
          && nameController.value.text == i.name
          && transportController.value.text == ''){
        residentSearch.add(i);
      }else if(idController.value.text == i.id
          && numberController.value.text == ''
          && nameController.value.text == ''
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }else if(idController.value.text == ''
          && numberController.value.text == i.number
          && nameController.value.text == ''
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }else if(idController.value.text == ''
          && numberController.value.text == ''
          && nameController.value.text == ''
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }else if(idController.value.text == i.id
          && numberController.value.text == i.number
          && nameController.value.text == ''
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }else if(idController.value.text == i.id
          && numberController.value.text == ''
          && nameController.value.text == i.name
          && transportController.value.text == i.type){
        residentSearch.add(i);
      }
    }
    if(search == false){
      return ResidentDataSource(residentList);
    }else if(search == true && idController.value.text =='' && numberController.value.text == '' && nameController.value.text == '' && transportController.value.text == ''){
      return ResidentDataSource(residentList);
    }else{
      return ResidentDataSource(residentSearch);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<GridColumn> getColumns() {
      return <GridColumn>[
        GridColumn(
            columnName: 'ID',
            width: screenWidth*0.2,
            label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: const [
                    Text('ID',
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(255, 31,20,86),
                            fontWeight: FontWeight.bold
                        ),
                        overflow: TextOverflow.clip, softWrap: true),
                  ],
                ))),
        GridColumn(
            columnName: 'User Name',
            width: screenWidth*0.2,
            label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: const Text('User Name',
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 31,20,86),
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip, softWrap: true))),
        GridColumn(
            columnName: 'Transport Type',
            width: screenWidth*0.2,
            label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: const Text('Transport Type',
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 31,20,86),
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip, softWrap: true))),
        GridColumn(
            columnName: 'Number',
            width: screenWidth*0.2,
            label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: const Text('Number',
                    style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 31,20,86),
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip, softWrap: true))),
        GridColumn(
            columnName: 'Lasted History',
            width: screenWidth*0.2,
            label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Lasted History', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 31,20,86),
                        fontWeight: FontWeight.bold),),
                    GestureDetector(
                      child: Icon(searchUpToDown == false
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,size: 17, color: const Color.fromARGB(255, 31,20,86),),
                      onTap: (){
                        setState(() {
                          searchUpToDown = !searchUpToDown;
                          searchDownToUp = !searchUpToDown;
                        });
                      },
                    )
                  ],
                )))
      ];
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 5,194,204),
        actions: [
          SizedBox(
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 SizedBox(
                  height: 50,
                    width: 200,
                    child: TextField(
                      controller: idController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        border:  OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        hintText: 'Card ID',
                      ),
                    )),
                 SizedBox(
                    height: 50,
                    width: 150,
                    child: TextField(
                      controller: numberController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        hintText: 'Number Plate',
                      ),
                    )),
                 SizedBox(
                    height: 50,
                    width: 200,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        hintText: 'User Name',
                      ),
                    )),
                 SizedBox(
                    height: 50,
                    width: 150,
                    child: TextField(
                      controller: transportController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 31,20,86))
                        ),
                        hintText: 'Transport',
                      ),
                    )),
                Row(
                  children: [
                    const Text('Search', style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 31,20,86),
                    ),),
                    const SizedBox(width: 10,),
                    SizedBox(
                      height: 50,
                      width: 80,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 31,20,86)
                          ),
                          onPressed: (){
                            setState(() {
                              search =true;
                            });
                          },
                          child: const Icon(Icons.search,)
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Expanded(child: SizedBox())
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getResidentDataSource(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              return snapshot.hasData
              ? SfDataGrid(source: snapshot.data, columns: getColumns())
              : Center(
                    child: SpinKitThreeInOut(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index.isEven
                                ? const Color.fromARGB(255, 31,20,86)
                                : const Color.fromARGB(255, 5,194,204),
                          ),
                        );
                      },
                      //color: Color.fromARGB(255, 31,20,86),
                      size: 50.0,
                    ),);}
      )
    ));
  }
}
