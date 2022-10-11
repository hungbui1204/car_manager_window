class SalesData {
  String? day;
  int? sales;

  SalesData({this.day, this.sales});

  SalesData.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    sales = json['sales'];
  }
}