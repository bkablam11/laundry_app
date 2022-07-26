
import 'package:app/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginPage.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
    // var  _ctrname = TextEditingController();
    // var  _ctrsurname = TextEditingController();
    // var  _ctrcontact = TextEditingController();
    var  _ctremail = TextEditingController();
    var  _ctrpassword = TextEditingController();
    // var  _ctrretry_password = TextEditingController();


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
                    // SizedBox(height: 10,),
                    // TextField(
                    //   //controller: _ctrname,
                    //   decoration: InputDecoration(
                    //     labelText: "Nom",
                    //     prefixIcon:Icon(Icons.account_circle, color: Colors.black),
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                    // TextField(
                    //   //controller: _ctrsurname,
                    //   decoration: InputDecoration(
                    //     labelText: "Prénoms",
                    //     prefixIcon:Icon(Icons.account_circle, color: Colors.black),
                    //   ),
                    // ),
                    // TextField(
                    //   //controller: _ctrcontact,
                    //   decoration: InputDecoration(
                    //     labelText: "N° de téléphone",
                    //     prefixIcon:Icon(Icons.phone_iphone, color: Colors.black),
                    //   ),
                    // ),
                    TextField(
                      controller: _ctremail,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon:Icon(Icons.email, color: Colors.black),
                      ),
                    ),
                    TextField(
                      controller: _ctrpassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Mot de passe ",
                        prefixIcon:Icon(Icons.password, color: Colors.black),
                      ),
                    ),
                    // TextField(
                    //   //controller: _ctrretry_password,
                    //   decoration: InputDecoration(
                    //     labelText: "Confirmer le Mot de passe",
                    //     prefixIcon:Icon(Icons.lock, color: Colors.black),
                    //   ),
                    // ),
                    // SizedBox(height: 30,),

                    //InkWell(
                    SizedBox(height: 50,),
                    SizedBox(height: 50,),
                    GestureDetector(
                      //onTap: openLoginPage,
                      onTap: (){
                        AuthController.instance.register(_ctremail.text.trim(), _ctrpassword.text.trim());
                        // Get.snackbar("Inscription "," Effectuée",
                        //   backgroundColor: Colors.redAccent,
                        //   snackPosition: SnackPosition.TOP,
                        //   titleText: Text("Connexion", style: TextStyle(color: Colors.white,),),
                        //   duration: Duration(seconds: 5),
                        // );
                      },
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
                Text("Se Connecter ?", style: TextStyle(
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

