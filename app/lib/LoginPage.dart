import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'HomePage.dart';
import 'package:app/StyleScheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/BarNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(LoginPage());
// }




//import 'package:app/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'HomePage.dart';
// import 'LoginPage.dart';
//
//
//
//
// class settings extends StatefulWidget {
//
//   @override
//   State<settings> createState() => _settingsState();
// }
//
// class _settingsState extends State<settings> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class SettingsFire extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder:(context, snapshot){
//         if (snapshot.connectionState==ConnectionState.waiting){
//           return Center (child: CircularProgressIndicator());
//         }else if (snapshot.hasError){
//           return Center(child: Text('quelque chose a mal tourné!'),);
//         }else if (snapshot.hasData){
//           return HomePage();
//         } else{
//           return LoginPage();
//         }
//       } ,
//     ) ,
//   )
//   ;
// }


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //navigatorKey: navigatorKey,
      theme: ThemeData(
          fontFamily: 'roboto'
      ),
      home: loginPage(),
    );
  }
}
class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final navigatorKey = GlobalKey<NavigatorState>;


  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

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
                    Text("Bienvenue !", style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'sfpro'
                    ),),
                    Text("Veuillez vous connecter à votre compte", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(height: 10,),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Mot de passe oublié ?", style: TextStyle(
                            color: Colors.grey
                        ),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    InkWell(
                      //onTap: openHomePage,
                      onTap: signIn,
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
                          child: Text("CONNEXION", style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'sfpro'
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Center(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text("OU")
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.black,
                                  width: 0.5
                              )
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('asset/images/googleLogo.png')
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.black,
                                  width: 0.5
                              )
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('asset/images/fbLogo.png')
                                )
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Vous n'avez pas de compte ?", style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'sfpro'
                ),),
                InkWell(
                  onTap: openSignUpPage,
                  child: Text(" S'ENREGISTRER", style: TextStyle(
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
  void openSignUpPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
  }
  void openHomePage()
  {
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavigationn()));
  }
  Future signIn() async{
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator(),)
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }

    // Navigator.of(context) not working
    //navigatorKey.currentState!.popUntil((route)=> route.isFirst);

  }
}
