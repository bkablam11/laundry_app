
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Onboarding.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'auth_controller.dart';

//initialization Firebase Auth
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp()
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), OpenOnBoard);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/bg.png")
          )
        ),
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/logo1.png")
              )
            ),
          ),
        ),
      ),
    );
  }
  void OpenOnBoard(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding()),);
  }
}
