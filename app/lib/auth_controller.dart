import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profil.dart';


import 'LoginPage.dart';

class AuthController extends GetxController{
  // AuthController.instance
  static AuthController instance = Get.find();
  // email, password
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  String email='';

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);

    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if (user==null){
      print("Connexion");
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(()=>ProfilPage(email:email));
    }
  }

  void register(String email, password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Inscription "," Reussie",
        backgroundColor: Color(0xFF5acc80),
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        titleText: Text("Connecté",style: TextStyle(color: Colors.white,),),
      );

    }catch(e){
      Get.snackbar("Erreur "," Probleme Authentification",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 5),
      titleText: Text("Echec de Connexion",
      style: TextStyle(
        color: Colors.white,
      ),
      ),
      messageText: Text(
        e.toString(),
        style: TextStyle(color: Colors.white
        ),
      ),
      );
      
    }
  }
  void logOut() async{
    await auth.signOut();
  }

}