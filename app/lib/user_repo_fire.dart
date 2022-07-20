import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/user_model.dart';

Future addUser(User user) async{
  final docUser = FirebaseFirestore.instance.collection("User").doc();
  user.id = docUser.id;
  await docUser.set(user.toJson());
}
