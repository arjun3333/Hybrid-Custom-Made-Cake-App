
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:order_page/info.dart';
import 'package:order_page/shapes.dart';
import 'package:order_page/startScreen.dart';

import 'create ui.dart';
import 'home.dart';

class tires extends StatefulWidget {
  const tires({Key? key}) : super(key: key);

  @override
  _tiresState createState() => _tiresState();
}

class _tiresState extends State<tires> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),


                child : AppBar(
                  leading: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>page1()));
                    },
                    icon:  Icon(Icons.home),),
                  title: Text("MakeMyCake"),
                  centerTitle: true,
                  backgroundColor:Color.fromRGBO(118, 60, 0, 10),


                )),
            body:
            Column(
                children: [
                  Container(

                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(

                                          child: FlatButton(
                                              onPressed: (){
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context)=>create()));
                                              },
                                              child: Image.asset("icons/cak2.png")),
                                        ),
                                      ),
                                      Text("Type",style: TextStyle(fontSize: 22),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blueGrey,
                                          child: FlatButton(
                                              onPressed: (){
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context)=>shape()));
                                              },

                                              child: Image.asset("icons/ss.png")),
                                        ),
                                      ),
                                      Text("Shape",style: TextStyle(fontSize: 22),)
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          child: FlatButton(
                                              onPressed: (){
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context)=>(tires())));
                                              },
                                              child: Image.asset("icons/layer.png")),
                                        ),
                                      ),
                                      Text("Tires",style: TextStyle(fontSize: 22),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          child: FlatButton(
                                              onPressed: ()
                                              {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context)=>info()));

                                              },
                                              child: Image.asset("icons/info.png")),
                                        ),
                                      ),
                                      Text("Info",style: TextStyle(fontSize: 22),)
                                    ],
                                  ),
                                ),


                              ]),
                        )


                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 32),
                    child: Text("please select appropriate cake options from \n available choices",
                    ),
                  ),

                  Expanded(child:
                  Container(
                    color: Colors.white,
                    height: 150,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18,left: 12,right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey,),

                                    height: 180,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Image.asset("icons/single.png",height: 120,),
                                        Text("Single tire",style: TextStyle(fontSize: 22,
                                            color: Colors.brown,fontWeight: FontWeight.w600),)
                                      ],
                                    ),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:30,top: 18,right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey,),

                                    height: 180,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 24,bottom: 10),
                                          child: Image.asset("icons/two.png",height: 100,),
                                        ),
                                        Text("Two Tires",
                                          style: TextStyle(fontSize: 22,
                                              color: Colors.brown,
                                              fontWeight: FontWeight.w600),)
                                      ],
                                    ),

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18,left: 12,right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey,),

                                    height: 180,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 18,bottom: 8),
                                          child: Image.asset("icons/three.png",height: 100,),
                                        ),
                                        Text("Three Tires",style: TextStyle(fontSize: 22,
                                            color: Colors.brown,
                                            fontWeight: FontWeight.w600
                                        ),)
                                      ],
                                    ),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:30,top: 18,right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey,),

                                    height: 180,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 18,bottom: 10),
                                          child: Image.asset("icons/four.png",height: 120,),
                                        ),
                                        Text("Four Tires",style: TextStyle(fontSize: 22,color: Colors.brown),)
                                      ],
                                    ),

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18,left: 12,right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey,),

                                    height: 150,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top:14,bottom: 20),
                                          child: Image.asset("icons/four.png",height: 80,),
                                        ),
                                        Text("Five Tires",style: TextStyle(fontSize: 22,color: Colors.brown),)
                                      ],
                                    ),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:30,top: 18,right: 10,bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey,),

                                    height: 160,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 28,bottom: 8),
                                          child: Image.asset("icons/flavour.png",height: 80,),
                                        ),
                                        Text("MAX height",style: TextStyle(fontSize: 22,color: Colors.brown),)
                                      ],
                                    ),

                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),



                      ],
                    ),),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(12.0),topLeft:Radius.circular(12.0) )),

                    width: double.maxFinite,
                    child:
                    Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:40,
                              right: 20),
                          child: RaisedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => shape()));
                          },

                            color: Colors.brown,
                            child: Text("Back",style: TextStyle(color: Colors.black54,fontSize: 22),),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: RaisedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => info()));
                          },

                            color: Colors.brown,
                            child: Text("Continue",style: TextStyle(color: Colors.black54,fontSize: 22),),),
                        ),
                      ],
                    ),
                  )
                ])));
  }
}
