import 'package:app/HomePage.dart';
import 'package:app/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class ForgotPasswd extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordPage(),
    );
  }
}


class ForgotPasswordPage extends StatefulWidget {

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Réinitialiser Mot de Passe"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Entrez votre email pour recevoir le mot de passe",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),),
              SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email)=>email!=null && !EmailValidator.validate(email)?'Entrer un email valide':null,
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(style: ElevatedButton.styleFrom(
                primary: Color(0xFF5acc80),
                minimumSize: Size.fromHeight(50),
              ),icon: Icon(Icons.email_outlined),
                label: Text('Réinitialiser Mot de passe', style: TextStyle(fontSize: 24)),
                onPressed: verifyEmail,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future verifyEmail() async{
    // showDialog(context: context,
    //     barrierDismissible: false ,
    //     builder: (BuildContext context) => new AlertDialog(
    //       title: new Text('Envoyé'),
    //       content: new Text('Consulter votre boite mail voir aussi les Spams'),
    //       actions: <Widget>[
    //         new IconButton(
    //             icon: new Icon(Icons.close),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             })
    //       ],
    //     ));

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      //Utils.showSnackBar('Mot de passe Envoyé par email');
      // Get.snackbar("Mot de passe Envoyé"," par email",
      //   backgroundColor: Color(0xFF5acc80),
      //   snackPosition: SnackPosition.TOP,
      //   duration: Duration(seconds: 2),
      //   titleText: Text("Envoyé",style: TextStyle(color: Colors.white,),),
      // );

      final text = 'Mot de Passe Envoyé - Voir Spam';
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await Future.delayed(Duration(seconds: 3));
      //Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()
      ));

    } on FirebaseAuthException catch(e){
      print(e);
      //Utils.showSnackBar(e.message);
      // Get.snackbar("Erreur ","",
      //   backgroundColor: Colors.redAccent,
      //   snackPosition: SnackPosition.TOP,
      //   duration: Duration(seconds: 5),
      //   titleText: Text("Echec",
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   messageText: Text(
      //     e.toString(),
      //     style: TextStyle(color: Colors.white
      //     ),
      //   ),
      // );

      final text = e.toString();
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await Future.delayed(Duration(seconds: 3));
      //Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswd()
      ));
    }
  }
}




