import 'package:app/HomePage.dart';
import 'package:app/profil.dart';
import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'package:app/BarNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class SettingsLogin extends StatefulWidget {

  @override
  _SettingsLoginState createState() => _SettingsLoginState();
}

class _SettingsLoginState extends State<SettingsLogin> {
  // Initialize Firebase App
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp =  await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return LoginPage();
          }
          return const Center(child: CircularProgressIndicator(),
          );
        },
      ) ,
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  //login function
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
  } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("Aucun utilisateur trouvé pour cet email");
    }
  }

  return user;
}

  @override
  Widget build(BuildContext context) {
    // create the textfiled Controller
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();

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
                    Text("Bienvenue !", style: TextStyle(
                        color: Color(0xFF5acc80),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'sfpro'
                    ),textAlign: TextAlign.center,),
                    Text("Veuillez vous connecter à votre compte", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    TextField(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon:Icon(Icons.mail, color: Colors.black),
                        labelText: "Email",
                      ),
                    ),
                    TextField(
                      controller:_passwordTextController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon:Icon(Icons.lock, color: Colors.black),
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
                      onTap:() async{
                        // let's test the app
                        User? user = await loginUsingEmailPassword(email: _emailTextController.text, password: _passwordTextController.text, context: context);
                        print(user);
                        if(user!=null){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainNavigationn()));
                        };
                      } ,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Color(0xFF5acc80),
                        ),
                        child: Center(
                          child:const Text("CONNEXION", style: TextStyle(
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
                SingleChildScrollView(
                  child: InkWell(
                    onTap: openSignUpPage,
                    child: Text(" S'ENREGISTRER", style: TextStyle(
                        color: Color(0xFF5acc80),
                        fontSize: 12,
                        fontWeight: FontWeight.w700
                    ),),
                  ),
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
}
