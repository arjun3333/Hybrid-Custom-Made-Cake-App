import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
            child: ListView(
                children: <Widget>[
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
                  //--------------------------
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      color: Color(0xFFEFEBE9),
                      width: double.infinity,
                      height: 700,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_back,
                                    size: 30,
                                    color: Colors.black,),
                                ),
                                SizedBox(width: 40,),
                                Text("Login Credentials",
                                  style: TextStyle(fontSize: 30, color: Colors.brown),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("sign in to your account",
                            style: TextStyle(
                                fontSize: 15,
                                color:Colors.brown),),
                          Container(
                            padding: EdgeInsets.only(top: 100),
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/logo1.png"),
                                  fit: BoxFit.fitHeight
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0, left:28.0, right: 28.0),
                            child: TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black12,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown, width: 5.0),
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                ),
                                hintText: 'Enter your Email',
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 18.0, left:28.0, right: 28.0),
                            child: TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black12,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown, width: 5.0),
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                ),
                                hintText: 'Enter your Password',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: TextButton(
                              child: Text("SIGN IN", style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),),
                              onPressed: (){
                                setState(() {
                                });
                              },
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromHeight(60),
                                primary: Colors.black,
                                onSurface: Colors.red,
                                backgroundColor: Colors.brown,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextButton(
                              child: Text("Sign in with Facebook", style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),),
                              onPressed: (){
                                setState(() {
                                });
                              },
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromHeight(40),
                                primary: Colors.black,
                                onSurface: Colors.red,
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ]
            ),
          );
  }
}
