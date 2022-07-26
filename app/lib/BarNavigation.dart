import 'package:app/profil.dart';
import 'package:flutter/material.dart';
import 'package:app/TrackOrderPage.dart';
import 'package:app/OrderPage.dart';
import 'package:app/HomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MainNavigationn extends StatefulWidget {
  @override
  _MainNavigationnState createState() => _MainNavigationnState();
}

class _MainNavigationnState extends State<MainNavigationn> {
  int index=1;
  final screens=[
    HomePage(),
    OrderPage(),
    TrackOrderPage(),
    ProfilPage(email: ''),
  ];

  @override
  final items = <Widget>[
    Icon(Icons.home, size: 30,),
    Icon(Icons.view_list, size: 30,),
    Icon(Icons.track_changes, size: 30,),
    Icon(Icons.person_outline, size: 30,),
  ];


  Widget build(BuildContext context) => Scaffold(

    body:screens[index],
    bottomNavigationBar:
    Theme( data: Theme.of(context).copyWith(
      iconTheme: IconThemeData(color: Colors.black),
    ),
      child: CurvedNavigationBar(
        color: Color(0xFF5acc80),
        backgroundColor: Colors.white,
        items: items,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 1000),
        index: index,
        onTap: (index)=>setState(()=>this.index = index),
        ),
    ),
    );
}
