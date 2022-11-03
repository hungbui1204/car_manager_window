class SalesData {
  DateTime date = DateTime.now();
  int? sales;

  SalesData({required this.date, this.sales});

  SalesData.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['day'].toString());
    sales = int.parse(json['sales'].toString());
  }
}