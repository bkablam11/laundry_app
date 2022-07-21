import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/StyleScheme.dart';
import 'OrderPage.dart';
import 'package:app/TrackOrderPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text("BLANCHISSERIE", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Color(0xfff1ffff),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NOTRE CREDO", style: headingStyle),
                            SizedBox(height: 5,),
                            Text("Vos vêtements, Notre Priorité",
                              style: TextStyle(
                              fontSize: 16,
                            ),),
                          ],
                        )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/images/bannerImg.png')
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("SERVICES", style: headingStyle),
            Container(
              height: 200,
              color: Color(0xfff1ffff),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/servicesImg.png')
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("QUALITE", style: headingStyle,),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: openOrderPage,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF5acc80),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Text("Passez votre commande", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              color: Color(0xfff1ffff),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("DISPONIBILITÉ ", style: headingStyle,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Nous sommes ouverts de 7h00 à 20h00")
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
  void openRelevantPage(int pageId)
  {
    print(pageId);
  }
  void openOrderPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
  }
}

