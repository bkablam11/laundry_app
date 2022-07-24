import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:app/BarNavigation.dart';
import 'LoginPage.dart';
import 'package:app/StyleScheme.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onboarding(),
    );
  }
}

class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/bg.png')
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onBoard1", "Choisissez des vêtements"),
                    onBoardPage("onBoard2", "Planifiez vos ramassage"),
                    onBoardPage("onBoard3", "Obtenez le meilleur service"),
                    onBoardPage("onBoard2", "Livraison en temps voulu"),
                    onBoardPage("onBoard4", "Payez plus tard"),
                  ],
                  onPageChanged: (value)=>{setCurrentPage(value)},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => getIndicator(index))
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: changePage,
              child: Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    color: Color(0xFF5acc80),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void changePage(){
    if(currentPage==4) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsFire()));
    }
    else{
      _pageController.animateToPage(
          currentPage +1 ,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear);
    }
  }

  setCurrentPage(int value){
    currentPage = value;
    setState((){
    });
  }

  AnimatedContainer getIndicator(int pageNo){
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage== pageNo) ? 20:10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (currentPage== pageNo) ? Color(0xFF5acc80): Colors.grey
      ),
    );
  }

  Column onBoardPage(String img, String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/$img.png')
            )
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: TextStyle(
            fontSize: 30,
            fontFamily: 'roboto',
            fontWeight: FontWeight.w500,
          ),textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text("Lorem ipsum, dolor sit amet consectetur adipisicing elit. Mollitia sequi nihil est ut debitis hic esse!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
                ),textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}

