import 'package:app/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/SignUpPage.dart';
import 'package:firebase_core/firebase_core.dart';


class AllUsers extends StatefulWidget {
  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    List<User> allusers=[];
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('User').orderBy('name').snapshots(),
        builder: (context, snp){
          if(snp.hasError){
            return Center(child: Text('Error'),);
          }
          if (snp.hasData){
            allusers= snp.data!.docs
                .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>)).toList();
            return ListView.builder(
                itemCount: allusers.length,
                itemBuilder: (context, index){
                  return Text(allusers[index].name);
                });
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
