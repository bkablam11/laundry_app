import 'package:app/user_model.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:app/StyleScheme.dart';
import 'dart:async';
import 'package:app/user_repo_fire.dart';

import 'package:firebase_core/firebase_core.dart';

import 'alluser_page.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signUpPage(),
    );
  }
}
class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/logo1.png')
                  )
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("S'enregistrer", style: TextStyle(
                        color: Color(0xFF5acc80),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'sfpro'
                    ),),
                    SizedBox(height: 10,),
                    TextField(
                      //controller: _ctrname,
                      decoration: InputDecoration(
                        labelText: "Nom",
                        prefixIcon:Icon(Icons.account_circle, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      //controller: _ctrsurname,
                      decoration: InputDecoration(
                        labelText: "Prénoms",
                        prefixIcon:Icon(Icons.account_circle, color: Colors.black),
                      ),
                    ),
                    TextField(
                      //controller: _ctrcontact,
                      decoration: InputDecoration(
                        labelText: "N° de téléphone",
                        prefixIcon:Icon(Icons.phone_iphone, color: Colors.black),
                      ),
                    ),
                    TextField(
                      //controller: _ctremail,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon:Icon(Icons.email, color: Colors.black),
                      ),
                    ),
                    TextField(
                      //controller: _ctrpassword,
                      decoration: InputDecoration(
                        labelText: "Mot de passe ",
                        prefixIcon:Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                    TextField(
                      //controller: _ctrretry_password,
                      decoration: InputDecoration(
                        labelText: "Confirmer le Mot de passe",
                        prefixIcon:Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 30,),

                    InkWell(
                      //onTap: openHomePage,
                      onTap: openLoginPage,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Color(0xFF5acc80),
                        ),
                        child: Center(
                          child: Text("S'enregistrer", style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'sfpro'
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("En cliquant sur s'inscrire, vous acceptez nos termes et conditions.", style: TextStyle(
                        fontSize: 15
                    ),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Vous avez déjà un compte ?", style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'sfpro'
                ),),
                InkWell(
                  onTap: openLoginPage,
                  child: Text(" CONNEXION", style: TextStyle(
                      color: Color(0xFF5acc80),
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  ),),
                )
              ],
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
  void openLoginPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>AllUsers()));

  }
}

