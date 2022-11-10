import 'dart:core';

class DateTimeMoment{
  String year = '';
  String month = '';
  String day = '';
  String hour = '';
  String minute = '';
  String second = '';
  DateTimeMoment(this.year, this.month, this.day, this.hour, this.minute, this.second);
  static DateTime toDateTime(DateTimeMoment a){
    String dateString = '${a.year}-${a.month}-${a.day} ${a.hour}:${a.minute}:${a.second}';
    DateTime dateTimeMoment = DateTime.parse(dateString);
    return dateTimeMoment;
  }

}
// int main(){
//   DateTimeMoment a = DateTimeMoment('2022', '11', '10', '08', '28', '30');
//   print(DateTimeMoment.toDateTime(a));
//   return 0;
// }