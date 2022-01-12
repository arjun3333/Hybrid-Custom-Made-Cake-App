
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:order_page/premade.dart';

class disc extends StatefulWidget {
  const disc({Key? key}) : super(key: key);

  @override
  _discState createState() => _discState();
}

class _discState extends State<disc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child : AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PreMade()));
              },),
            title: Text("MakeMyCake"),
            centerTitle: true,
            backgroundColor:Color.fromRGBO(118, 60, 0, 10),
          ),),
        body: SafeArea(
          child: Column(
            children: <Widget> [
              Container(
                width: double.infinity,
                height: 260,
                color: Colors.white,
                child: Image(
                  image: AssetImage('images/coco cream cake.jpg'),
                  width: double.infinity,
                  fit: BoxFit.fill,
                ) ,
              ),
              Container(
                child: Column(
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Center(
                        child: Text('Chocolate Cake', style: TextStyle(
                          color: Colors.brown,
                          fontFamily: 'MonteCarlo',
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: Text('Details:', style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('This Chocolate Cake is around 637 calories, with 38 grams of fat, 32 grams of carbs, and 20 grams of sugar.', style: TextStyle(
                        color: Colors.brown,
                        fontSize: 22,
                      ),),
                    ),
                    Row(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 15.0),
                          child: Text('Price: 60', style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        children: <Widget> [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextButton(
                              onPressed: (){
                                setState(() {

                                });
                              },
                              child: Text('ADD TO CART', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromWidth(195),
                                primary: Colors.brown,
                                onSurface: Colors.red,
                                backgroundColor: Color(0xFFBCAAA4),
                              ),
                            ),
                          ),
                          SizedBox(width:5.0),
                          TextButton(
                            onPressed: (){
                              setState(() {

                              });
                            },
                            child: Text('ADD TO FAVORITE', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                            style: TextButton.styleFrom(
                              fixedSize: Size.fromWidth(195),
                              primary: Colors.brown,
                              onSurface: Colors.red,
                              backgroundColor: Color(0xFFBCAAA4),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
