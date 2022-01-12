import 'package:flutter/material.dart';
import 'package:order_page/create%20ui.dart';
import 'package:order_page/shapes.dart';
import 'package:order_page/tierscake.dart';

import 'delivery_screen.dart';

class info extends StatefulWidget {
  const info({Key? key}) : super(key: key);

  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child : AppBar(
            leading: Icon(Icons.home),
            title: Text("Create Your Own Cake"),
            centerTitle: true,
            backgroundColor:Color.fromRGBO(118, 60, 0, 10),
          ),),
        body: SafeArea(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: const EdgeInsets.all(28.0),
                child: Text('Please select appropriate cake options from available choices.', style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFBCAAA4),
                ),),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 18, right: 165.0),
                child: Center(
                  child: TextButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text('UPLOAD HERE', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.brown,
                    ),),
                    style: TextButton.styleFrom(
                      fixedSize: Size.fromWidth(200),
                      primary: Colors.black,
                      onSurface: Colors.red,
                      backgroundColor: Color(0xFFBCAAA4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 18.0),
                child: Text('Note', style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0, left:18.0, right: 28.0),
                child: TextField(
                  obscureText: false,

                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 90, horizontal: 15),
                    filled: true,
                    fillColor: Colors.black12,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 5.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Type here',
                    labelStyle: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                    ),
                    // hintText: 'Type Here',
                  ),
                ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => tires()));
                      },

                        color: Colors.brown,
                        child: Text("Back",style: TextStyle(color: Colors.black54,fontSize: 22),),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: RaisedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryScreen()));
                      },

                        color: Colors.brown,
                        child: Text("Continue",style: TextStyle(color: Colors.black54,fontSize: 22),),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}