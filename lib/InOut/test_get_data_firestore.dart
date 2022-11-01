
import 'package:firedart/firedart.dart';
import 'package:intl/intl.dart';

const apiKey = 'AIzaSyCdnTfbryr5lxHakHyEcvnBx6CHdGye5-E';
const projectId = 'flutter-car-manager-mobile';

void main() async{
  Firestore.initialize(projectId);
  var firestore = Firestore(projectId);

  // Test get all data in collection
  //
  // var ref = await firestore.collection('user_data').get();

  // var reference = await firestore.document(ref[2].path).get();
  // if (reference['id']=="19119195"){
  //   print("deo ok");
  // }
  // else  print("Cung ok");
  // // ref.stream.listen((document) => print('name: $document'));

  //Use .where to find path
  //
  var ref = await firestore.collection('user_data').where('id', isEqualTo: "19119195").get();
  var refe = await firestore.document(ref.first.path).get();
  print(refe['history']);
  DateTime date = DateTime.now();
  print(date);
  String dateformat = DateFormat('HH:mm:ss dd/M/yy').format(date);
  print(dateformat);
  firestore.document(ref.first.path).update(
      {'history': dateformat});
  // await refe.create({'historys': '00:00:00'});

  // Test Format DateTime
  //


}