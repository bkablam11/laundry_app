import 'package:app/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'BarNavigation.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({Key? key}) : super(key: key);

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email'
      ]
  );

  GoogleSignInAccount? _currentUser;

  @override
  void initState(){
    _googleSignIn.onCurrentUserChanged.listen((account){
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget(){
    GoogleSignInAccount? user = _currentUser;
    if(user!=null){
      return Padding(padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: GoogleUserCircleAvatar(identity: user),
              title: Text(user.displayName ?? ''),
              subtitle: Text(
                'Connexion réussie',
                style: TextStyle(fontSize: 20),
              )
              ,),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: signOut, child: const Text('Deconnexion')
            ),
          ],
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const Text("Vous n'êtes pas connecté", style: TextStyle(fontSize: 20)
              ,),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: signIn, child: const Text("S'enregistrer")),
          ],
        ),
      );

    }

  }

  void signOut(){
    _googleSignIn.disconnect();
  }

  Future<void>signIn() async{
    try{
      _googleSignIn.signIn();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavigationn()));
    }catch(e){
      print("Erreur de connexion avec $e");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

    }


  }




}


