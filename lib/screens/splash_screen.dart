import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  SplashScreen extends StatelessWidget {
  const  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/Home');
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/img/splash.jpeg",fit: BoxFit.cover,),
          ),
        ],
      ),
    );
  }
}
