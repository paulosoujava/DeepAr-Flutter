import 'package:flutter/material.dart';
import 'package:flutter_app/camera.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Camera(),
      title: Text("AR FAce Masks App",
      style: TextStyle(
        fontSize: 55,
        color: Colors.deepPurpleAccent,
        fontFamily: 'Signatra'
        ),
      ),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text("From Coding Cofe",
      style: TextStyle(
          fontSize: 16,
          color: Colors.deepPurpleAccent,
          fontFamily: 'Brand Bod'
      ),),
    );
  }

}