import 'package:app/auth_controller.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

// class ProfilPage extends StatefulWidget {
//   @override
//   _ProfilPageState createState() => _ProfilPageState();
// }

class ProfilPage extends StatelessWidget {
  String email;
  ProfilPage({Key? key, required this.email}) : super(key: key);


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
                    Text("Au Revoir !", style: TextStyle(
                        color: Color(0xFF5acc80),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'sfpro'
                    ),textAlign: TextAlign.center,),
                Text(email,
                style: TextStyle(fontSize: 18),),
                GestureDetector(
                  onTap: (){
                    AuthController.instance.logOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Color(0xFF5acc80),
                    ),
                    child: Center(
                      child:const Text("Deconnexion", style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'sfpro'
                      ),),
                    ),
                  ),
                ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
