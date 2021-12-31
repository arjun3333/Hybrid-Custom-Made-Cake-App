
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:order_page/cart.dart';
import 'package:order_page/create%20ui.dart';
import 'package:order_page/premade.dart';
import 'package:order_page/profile.dart';
import 'startScreen.dart';
class nav extends StatefulWidget {
  const nav({Key? key}) : super(key: key);

  @override
  _navState createState() => _navState();
}

class _navState extends State<nav> {
  int selectedIndex = 0;
  final screens = <Widget>[
    page1(),
   premade(),
    create(),
    cart(),
    profile()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
    child: AppBar(
    leading: Icon(Icons.add_location_outlined),
    title: Text("MakeMyCake"),
    centerTitle: true,
    backgroundColor: Color.fromRGBO(118, 60, 0, 10),
    )),

        body:screens[selectedIndex] ,

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(0),
            child: BottomNavigationBar(

              backgroundColor: Color.fromRGBO(118, 60, 0, 10),
              selectedItemColor: Colors.lightBlueAccent,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              items: const <BottomNavigationBarItem>[



                BottomNavigationBarItem(

                  icon: Icon(Icons.home,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(

                  icon: Icon(Icons.cake),
                  label: 'PreMade',

                ),
                BottomNavigationBarItem(

                  icon: Icon(Icons.add_circle_rounded,size: 35,color: Colors.orangeAccent,),
                  label: 'Create',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart_outlined),
                  label: 'Bag',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Account',
                ),
              ],
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              }
            ),
          ),

        ));
  }
}
