import 'package:flutter/material.dart';
import 'package:app/StyleScheme.dart';
import 'OrderPage.dart';

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
                            Text("BÉNISSEZ CETTE PAGAILLE", style: headingStyle),
                            SizedBox(height: 5,),
                            Text("Nous prennons vos vêtements et leur donnons un nouveau look.", style: TextStyle(
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
                      width: 180,
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
                                  gradient:gradientStyle,
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
                      Text("DISPONIBILITÉ ", style: contentStyle,),
                      Text("DISPONIBLE", style: contentStyle.copyWith(color: Colors.blue),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Nous sommes ouverts de 7h00 à 20h00")
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
                  Text("VÉRIFIER L'ESTIMATION", style: contentStyle,),
                  SizedBox(height: 10,),
                  Text("Vous pouvez vérifier l'estimation du temps avec le prix", style: contentStyle,),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      gradient: gradientStyle,
                      shape: BoxShape.circle
                  ),
                  child: Text("+", style: TextStyle(
                      color: Colors.white,
                      fontSize: 40
                  ),),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        iconSize: 30,
        onTap: (value) => {openRelevantPage(value)},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.track_changes),
              label: "Track Order"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: "My Orders"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: "Profile",
          ),
        ],
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

