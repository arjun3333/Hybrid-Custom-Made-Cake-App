
import 'package:flutter/material.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  _favouritesState createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
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
            ),),
          body: SafeArea(
            child: ListView(
              children: <Widget> [
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Color(0xFFEFEBE9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(onPressed: () {
                          setState(() {

                          });
                        },
                            child: Text('ORDERS', style: TextStyle(
                              color: Colors.brown,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(onPressed: (){
                          setState(() {
                          });
                        },
                            child: Text('FAVORITES', style: TextStyle(
                              color: Colors.brown,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,),)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(onPressed: (){
                          setState(() {
                          });
                        },
                            child: Text('LOGIN', style: TextStyle(
                              color: Colors.brown,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,),)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Color(0xFFEFEBE9),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 180,
                            child: Image(
                              image: AssetImage('images/cream layer cake.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text('Cream layer Cake', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text("Price: 60", style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.favorite, color: Colors.red,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text('Favorite', style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
                //......................................
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Color(0xFFEFEBE9),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 180,
                            child: Image(
                              image: AssetImage('images/Fresh-Strawberry-Cake.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text('Strawberry Cake', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text("Price: 80", style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.favorite, color: Colors.red,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text('Favorite', style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
                //...................................
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Color(0xFFEFEBE9),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 180,
                            child: Image(
                              image: AssetImage('images/PineApple-Cake.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text('PineApple Cake', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text("Price: 65", style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.favorite, color: Colors.red,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text('Favorite', style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
                //......................................
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Color(0xFFEFEBE9),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 180,
                            child: Image(
                              image: AssetImage('images/pink rosette cake.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text('Pink Rosette Cake', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text("Price: 72", style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.favorite, color: Colors.red,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text('Favorite', style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
                //...................................
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Color(0xFFEFEBE9),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 180,
                            child: Image(
                              image: AssetImage('images/red-valvet cake.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text('Red Valvet Cake', style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top:20.0),
                                child: Text("Price: 62", style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.favorite, color: Colors.red,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text('Favorite', style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          //---------------------------------------------------------------------

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
            ),
          ),
          //--------------------------------------------------------
        )
    );
  }
}
