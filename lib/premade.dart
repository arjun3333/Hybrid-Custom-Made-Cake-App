import 'package:flutter/material.dart';

class premade extends StatefulWidget {
  const premade({Key? key}) : super(key: key);

  @override
  _premadeState createState() => _premadeState();
}

class _premadeState extends State<premade> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    var editingController;
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
        body: Container(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (value){

                          },
                           controller : editingController,
                          decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                        ),
                        ), Expanded(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.blueGrey,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 130,

                    child:
                 Image.asset("cake8.jpg",height: 70,width: 70,),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Choco Lava",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,

                        ),),


                        Text(" crispy choco chips"),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            children: [
                              Icon(Icons.favorite,
                                color: Colors.pink,),
                              Text("FAV"),
                              Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                              Text("14km"),
                              Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                              Text("45 mins"),
                            ],
                          ),
                        )

                      ],
                    ),
                  )
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
             child:  Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 8.0,left: 8.0,right: 8.0),
              child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 130,

                        child:
                        Image.asset("images/cake8.jpg",height: 70,width: 70,),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Choco Lava",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,

                            ),),


                            Text(" crispy choco chips"),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite,
                                    color: Colors.pink,),
                                  Text("FAV"),
                                  Icon(Icons.add_location_rounded,color: Colors.greenAccent,),
                                  Text("14km"),
                                  Icon(Icons.access_time_outlined,color: Colors.orangeAccent, ),
                                  Text("45 mins"),
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            

          ],
        )
      )]


    )))

                    ,

                  );

  }
}
