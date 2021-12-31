import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:order_page/create%20ui.dart';
import 'package:order_page/startScreen.dart';
import 'nav.dart';
import 'startScreen.dart';

void main() {
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return nav();
  }
  }




