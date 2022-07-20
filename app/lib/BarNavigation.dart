import 'package:flutter/material.dart';
import 'package:app/TrackOrderPage.dart';
import 'package:app/OrderPage.dart';
import 'package:app/HomePage.dart';
import 'package:app/profil.dart';
import 'package:app/OrderConfirmPage.dart';
import 'package:app/alluser_page.dart';


class MainNavigationn extends StatefulWidget {
  @override
  _MainNavigationnState createState() => _MainNavigationnState();
}

class _MainNavigationnState extends State<MainNavigationn> {
  int index=0;
  final screens=[
    HomePage(),
    OrderPage(),
    TrackOrderPage(),
    //orderConfirmPage(),
    //ProfilPage(),
    //AllUsers(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[index],
    bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.orange,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
      ),

      child: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index)=>setState(()=>this.index=index),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Acceuil"),
          NavigationDestination(icon: Icon(Icons.view_list), label: "Commandes"),
          NavigationDestination(icon: Icon(Icons.track_changes), label: "Suivi"),
          //NavigationDestination(icon: Icon(Icons.group_outlined), label: "Profil"),
        ],
      ),
    ),
  );
}
