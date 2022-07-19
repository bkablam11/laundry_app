import 'package:flutter/material.dart';
import 'package:app/StyleScheme.dart';
import 'package:app/TrackOrderPage.dart';

class OrderConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: orderConfirmPage(),
    );
  }
}
class orderConfirmPage extends StatefulWidget {
  @override
  _orderConfirmPageState createState() => _orderConfirmPageState();
}

class _orderConfirmPageState extends State<orderConfirmPage> {
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
        title: Text("Commande confirmée", style: TextStyle(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/onBoard2.png')
                  )
              ),
            ),
            SizedBox(height: 15,),
            Text("Merci de nous avoir choisis !", style: headingStyle,),
            Text("Votre commande a été placée et nous viendrons chercher vos vêtements à temps !", style: contentStyle,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("N° de commande", style: headingStyle,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: gradientStyle,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text("1001", style: headingStyle.copyWith(
                      color: Colors.white
                  ),),
                )
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Comptage des vêtements", style: headingStyle,),
                Text("7", style: headingStyle.copyWith(
                    color: Colors.grey
                ),),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Montant total", style: headingStyle,),
                Text("225", style: headingStyle.copyWith(
                    color: Colors.grey
                ),),
              ],
            ),
            divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date et heure du ramassage", style: headingStyle,),
                Text("Mercredi, 07 Août, 2022. Entre 10:00 AM et 12:00 PM", style: contentStyle.copyWith(
                    color: Colors.grey,
                    fontSize: 16
                ),),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Paiement", style: headingStyle,),
                Text("Espèces", style: headingStyle.copyWith(
                    color: Colors.grey
                ),),
              ],
            ),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackOrderPage()));},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: gradientStyle
                ),
                child: Center(
                  child: Text("SUIVRE COMMANDE", style: contentStyle.copyWith(
                      color: Colors.white,
                      fontSize: 17
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Container divider()
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: Colors.grey,
    );
  }
}

