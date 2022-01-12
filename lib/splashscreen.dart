import 'dart:async';

import 'package:flutter/material.dart';
import 'package:order_page/startScreen.dart';

import 'page1.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => page1())));

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Image.asset("cake8.jpg",height: 200,width: 200,),

      ),
      ),

    );
  }
}
