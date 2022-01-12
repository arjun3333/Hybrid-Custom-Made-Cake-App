import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:order_page/create%20ui.dart';
import 'premade.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {

  int selectedIndex = 0;
  final List<String> slideimage = [
    'images/cake1.jpg',
    'images/cake2.jpg',
    'images/cake10.jpg',
    'images/cake4.jpg',
    'images/cake5.jpg',
    'images/cake6.jpg',
    'images/cake7.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(173, 216, 230, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23, left: 16),
                      child: Text(
                        "Create your\n Own Cake",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20),
                      child: Text(
                        "Make cakes for your \n loved ones",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w200),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 17),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>create()));
                        },
                        color: Colors.blueAccent,
                        child: Text(
                          "CREATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                      height: 190,
                      width: 180,
                      child: Image.asset('images/cake17.jpg')),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CarouselSlider(
              options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  //enableInfiniteScroll: true,
                  enlargeCenterPage: true),
              items: slideimage
                  .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      e,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ))
                  .toList()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: 150.0,
            height: 50.0,
            child: RaisedButton(
              color: Colors.brown,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => PreMade()));
              },
              child: Text("OrderNow",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),
            ),
          ),
        ),
      ]),
    );
  }
}
