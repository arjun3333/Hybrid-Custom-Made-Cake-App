import 'package:flutter/material.dart';
class shape extends StatefulWidget {
  const shape({Key? key}) : super(key: key);

  @override
  _shapeState createState() => _shapeState();
}

class _shapeState extends State<shape> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),


                child : AppBar(
                  leading: Icon(Icons.home),
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

                                          child: Image.asset("icons/cak4..png"),
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
                                          child: Image.asset("icons/ss.png"),
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
                                          child: Image.asset("icons/measure.png"),
                                        ),
                                      ),
                                      Text("Size",style: TextStyle(fontSize: 22),)
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
                                          child: Image.asset("icons/layer.png"),
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
                                          child: Image.asset("icons/info.png"),
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
                                        Image.asset("icons/heart2.png",),
                                        Text("Heart",style: TextStyle(fontSize: 22,
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
                                          child: Image.asset("icons/hexagon1_cake.png",height: 100,),
                                        ),
                                        Text("Hexagon",
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
                                          child: Image.asset("icons/square2.png",height: 100,),
                                        ),
                                        Text("Square",style: TextStyle(fontSize: 22,
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
                                          child: Image.asset("icons/round2.png",height: 120,),
                                        ),
                                        Text("Round",style: TextStyle(fontSize: 22,color: Colors.brown),)
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
                                          child: Image.asset("icons/alphabet4.png",height: 80,),
                                        ),
                                        Text("Alhabetic",style: TextStyle(fontSize: 22,color: Colors.brown),)
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
                                          child: Image.asset("icons/numeric2",height: 80,),
                                        ),
                                        Text("Number",style: TextStyle(fontSize: 22,color: Colors.brown),)
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
                    child: RaisedButton(onPressed: (){},

                      color: Colors.brown,
                      child: Text("Continue",style: TextStyle(color: Colors.black54,fontSize: 22),),),
                  )
                ])));
  }
}
