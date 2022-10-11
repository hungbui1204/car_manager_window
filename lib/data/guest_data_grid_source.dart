import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:car_manager_window/model/guest_model.dart';
class GuestDataSource extends DataGridSource{
  GuestDataSource(this.dataList){
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<GuestData> dataList;
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
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow() {
    dataGridRows = dataList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'ID', value: dataGridRow.id),
        DataGridCell<String>(
            columnName: 'Transport Type', value: dataGridRow.type),
        DataGridCell<String>(
            columnName: 'Number', value: dataGridRow.number),
        DataGridCell<String>(columnName: 'Time In', value: dataGridRow.timeIn)
      ]);
    }).toList(growable: false);
  }
}
