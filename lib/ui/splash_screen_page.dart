
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_cupertino_app/ui/home_page.dart';
import 'dart:async';
import 'package:flutter/material.dart';


class SplashScreenPage extends StatefulWidget {
  static const routeName = '/splash_screen_page';

  @override
  _SplashScreen  createState() =>
    _SplashScreen();

}

class _SplashScreen extends State<SplashScreenPage>{

  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushNamedAndRemoveUntil(HomePage.routeName, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.android,size: 100,color: Colors.white,),
            SizedBox(height: 24,),
            Text(
              "Splash"
            )
          ],
        ),
      ),
    );
  }
  
}