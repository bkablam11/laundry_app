import 'package:flutter/material.dart';
import 'package:app/StyleScheme.dart';
import 'package:app/OrderConfirmPage.dart';

class PickUpTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pickUpTimePage(),
    );
  }
}
class pickUpTimePage extends StatefulWidget {
  @override
  _pickUpTimePageState createState() => _pickUpTimePageState();
}

class _pickUpTimePageState extends State<pickUpTimePage> {
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
        title: Text("Choississez la date et l'heure", style: TextStyle(
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
            Text("Date de ramassage", style: headingStyle,),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateWidget("Mer", "07 Aug", true),
                  dateWidget("Jeu", "08 Aug", false),
                  dateWidget("Ven", "09 Aug", false),
                  dateWidget("Sam", "10 Aug", false),
                  dateWidget("Lun", "12 Aug", false),
                  dateWidget("Mar", "13 Aug", false)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 15,),
            Text("Heure de prise en charge", style: headingStyle,),
            SizedBox(height: 15,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeWidget("De 10h00 à 12h00", false),
                  timeWidget("De 12h00 à 14h00", true),
                  timeWidget("De 14h00 à 16h00", false),
                  timeWidget("De 16h00 à 18h00", false),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("Delivery Date", style: headingStyle,),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateWidget("Mer", "10 Aug", true),
                  dateWidget("Jeu", "11 Aug", false),
                  dateWidget("Ven", "12 Aug", false),
                  dateWidget("Sam", "13 Aug", false),
                  dateWidget("Lun", "14 Aug", false),
                  dateWidget("Mar", "15 Aug", false)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 15,),
            Text("Temps de livraison", style: headingStyle,),
            SizedBox(height: 15,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeWidget("De 10h00 à 12h00", false),
                  timeWidget("De 12h00 à 14h00", true),
                  timeWidget("De 14h00 à 16h00", false),
                  timeWidget("De 16h00 à 18h00", false),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Montant total à payer", style: headingStyle,),
                Text("\F22500", style: headingStyle,)
              ],
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConfirmPage()));},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: gradientStyle
                ),
                child: Center(
                  child: Text("ORDRE DE PLAYEMENT", style: contentStyle.copyWith(
                      color: Colors.white,
                      fontSize: 22
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Container dateWidget(String day, String date, bool isActive)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: (isActive) ? Colors.orange : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day, style: contentStyle.copyWith(
              color: (isActive) ? Colors.white : Colors.black,
              fontSize: 23
          ),),
          Text(date, style: contentStyle.copyWith(
              color: (isActive) ? Colors.white : Colors.black,
              fontSize: 18
          ),)
        ],
      ),
    );
  }
  Container timeWidget(String time, bool isActive)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: (isActive) ? Colors.orange : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: contentStyle.copyWith(
            color: (isActive) ? Colors.white : Colors.black,
          ),),

        ],
      ),
    );
  }
}

