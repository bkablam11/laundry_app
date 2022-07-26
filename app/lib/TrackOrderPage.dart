import 'package:app/profil.dart';
import 'package:flutter/material.dart';
import 'OrderConfirmPage.dart';
import 'package:app/StyleScheme.dart';
import 'package:app/HomePage.dart';
import 'package:app/OrderPage.dart';



class TrackOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: trackOrderPage(),
    );
  }
}
class trackOrderPage extends StatefulWidget {
  @override
  _trackOrderPageState createState() => _trackOrderPageState();
}

class _trackOrderPageState extends State<trackOrderPage> {
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
        title: Text("Suivie de la Commande", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("N° COMMANDE 1001", style: headingStyle,),
            Text("Commande confirmée.", style: contentStyle.copyWith(
                color: Colors.grey,
                fontSize: 16
            ),),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 1,
              color: Colors.grey,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 13, top: 50),
                  width: 4,
                  height: 300,
                  color: Colors.grey,
                ),
                Column(
                  children: [
                    statusWidget('confirmed', "Confirmé", true),
                    statusWidget('onBoard2', "Ramassé", true),
                    statusWidget('servicesImg', "Payé", true),
                    statusWidget('Delivery', "Livré", false),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 1,
              color: Colors.grey,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: openHomePage,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Color(0xFF5acc80),
                        )
                    ),
                    child: Text("ANNULER", style: contentStyle.copyWith(
                        color: Color(0xFF5acc80),
                    ),),


                  ),
                ),
                InkWell(
                  onTap: openOrderPage,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFF5acc80),
                    ),
                    child: Text("Mes commandes", style: contentStyle.copyWith(
                        color: Colors.white
                    ),),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Container statusWidget(String img, String status, bool isActive)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isActive) ? Color(0xFF5acc80) : Colors.white,
                border: Border.all(
                    color: (isActive) ? Colors.transparent : Color(0xFF5acc80),
                    width: 3
                )
            ),
          ),
          SizedBox(width: 50,),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/$img.png"),
                        fit: BoxFit.contain
                    )
                ),
              ),
              Text(status, style: contentStyle.copyWith(
                  color: (isActive) ? Color(0xFF5acc80) : Colors.black
              ),)
            ],
          )
        ],
      ),
    );
  }

  void openHomePage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  void openOrderPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilPage(email: '',)));
  }

}
