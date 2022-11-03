import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:car_manager_window/model/resident_model.dart';
class ResidentDataSource extends DataGridSource{
  ResidentDataSource(this.dataList){
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<ResidentData> dataList;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          //DateFormat('MM/dd/yyyy').format(row.getCells()[3].value).toString(),
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
          child: Text(
            row.getCells()[4].value.toString(),
            overflow: TextOverflow.ellipsis,
          ))
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow() {
    dataGridRows = dataList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'ID', value: dataGridRow.id),
        DataGridCell<String>(
            columnName: 'User Name', value: dataGridRow.name),
        DataGridCell<String>(
            columnName: 'Transport Type', value: dataGridRow.type),
        DataGridCell<String>(
            columnName: 'Number', value: dataGridRow.number),
        DataGridCell<DateTime>(columnName: 'Time In', value: dataGridRow.timeIn)
      ]);
    }).toList(growable: false);
  }
}
