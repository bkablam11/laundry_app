import 'package:app/user_model.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:app/StyleScheme.dart';
import 'dart:async';
import 'package:app/user_repo_fire.dart';

import 'package:firebase_core/firebase_core.dart';

import 'alluser_page.dart';

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(SignUpPage());
// }

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SignUpPage());

}


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
    // final _ctrname = TextEditingController();
    // final _ctrsurname = TextEditingController();
    // final _ctrcontact = TextEditingController();
    // final _ctremail = TextEditingController();
    // final _ctrpassword = TextEditingController();
    // final _ctrretry_password = TextEditingController();

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
                      image: AssetImage('asset/images/logo.png')
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
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'sfpro'
                    ),),
                    SizedBox(height: 10,),
                    TextField(
                      //controller: _ctrname,
                      decoration: InputDecoration(
                        labelText: "Nom",
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      //controller: _ctrsurname,
                      decoration: InputDecoration(
                        labelText: "Prénoms",
                      ),
                    ),
                    TextField(
                      //controller: _ctrcontact,
                      decoration: InputDecoration(
                        labelText: "N° de téléphone",
                      ),
                    ),
                    TextField(
                      //controller: _ctremail,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    TextField(
                      //controller: _ctrpassword,
                      decoration: InputDecoration(
                        labelText: "Mot de passe ",
                      ),
                    ),
                    TextField(
                      //controller: _ctrretry_password,
                      decoration: InputDecoration(
                        labelText: "Confirmer le Mot de passe",
                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: (){
                        // final user=User(name: _ctrname.text,
                        //     surname: _ctrsurname.text,
                        //     contact: _ctrcontact.text,
                        //     email: _ctremail.text,
                        //     password: _ctrpassword.text,
                        //     retry_password: _ctrretry_password.text) ;
                        // addUser(user);
                        // _ctrname.text='';
                        // _ctrsurname.text='';
                        // _ctrcontact.text='';
                        // _ctremail.text='';
                        // _ctrpassword.text='';
                        // _ctrretry_password.text='';
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            gradient: LinearGradient(
                                colors: [Color(0xfff3953b), Color(0xffe57509)],
                                stops: [0,1],
                                begin: Alignment.topCenter
                            )
                        ),
                        child: Center(
                          child: Text("S'enregistrer", style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'sfpro'
                          ),),
                        ),
                        // width: double.infinity,
                        // child: Icon(Icons.add,
                        //   size: 32,),),
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
                      color: Colors.orange,
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

