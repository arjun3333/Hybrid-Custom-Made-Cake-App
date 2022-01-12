import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order_page/favourites_cake_screen.dart';
import 'package:order_page/premade.dart';
import 'package:order_page/sign_up_screen.dart';
import 'package:route_animation_helper/route_animation_helper.dart';

import 'custom_alert_dialog.dart';
import 'order_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: <Widget>[
        Container(
          width: double.infinity,
          height: 60,
          color: const Color(0xFFEFEBE9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                            RouteAnimationHelper.createRoute(
                                buildContext: context,
                                destination: const OrderScreen(),
                                animType: AnimType.slideStart));
                      });
                    },
                    child: const Text(
                      'ORDERS',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          RouteAnimationHelper.createRoute(
                              buildContext: context,
                              destination: const FavouritesCakeScreen(),
                              animType: AnimType.slideStart));
                    },
                    child: const Text(
                      'FAVORITES',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
        ),
        //--------------------------
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            color: const Color(0xFFEFEBE9),
            width: double.infinity,
            height: 700,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Login Credentials",
                        style: TextStyle(fontSize: 30, color: Colors.brown),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "sign in to your account",
                  style: TextStyle(fontSize: 15, color: Colors.brown),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/app_logo.jpg"),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 18.0, left: 28.0, right: 28.0),
                  child: TextField(
                    obscureText: false,
                    controller: _emailController,
                    decoration: const InputDecoration(
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
                  padding:
                  const EdgeInsets.only(top: 18.0, left: 28.0, right: 28.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: false,
                    decoration: const InputDecoration(
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: TextButton(
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            _doLogin();
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(60),
                            primary: Colors.black,
                            onSurface: Colors.red,
                            backgroundColor: Colors.brown,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: TextButton(
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                                RouteAnimationHelper.createRoute(
                                    buildContext: context,
                                    destination: const SignUpScreen(),
                                    animType: AnimType.slideStart));
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(60),
                            primary: Colors.black,
                            onSurface: Colors.red,
                            backgroundColor: Colors.brown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    child: const Text(
                      "Sign Up with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _signInWithGoogle();
                      });
                    },
                    style: TextButton.styleFrom(
                      fixedSize: const Size.fromHeight(40),
                      primary: Colors.black,
                      onSurface: Colors.red,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (FirebaseAuth.instance.currentUser != null &&
                        FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {
                      await FirebaseAuth.instance.signOut();
                      _showSnackBar("You have SuccessFully Logout");
                    } else {
                      _showSnackBar("Please first do a login");
                    }
                  },
                  child: const Text("Logout"),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  _doLogin() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        print("=== login success ${userCredential.user?.uid}");
        _showSnackBar("You have SuccessFully Logged In");
      } on FirebaseAuthException catch (e) {
        print(e.message);
        _showLoginDialog(e.message);
      }
    }
  }

  _showLoginDialog(String? message) {
    CustomAlertDialog(
      context: context,
      title: "MakeMyCake",
      message: message ?? "Something went wrong",
      okText: "Ok",
      onPressedOk: () {},
    ).show();
  }

  _signInWithGoogle() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      var userCredential = await auth.signInWithCredential(credential);
      print("=== login success ${userCredential.user?.uid}");
      _showSnackBar("You have SuccessFully Sign Up with Google");
    } on FirebaseAuthException catch (e) {
      print(e);
      _showLoginDialog(e.message);
    } catch (e) {
      print(e);
      _showLoginDialog("Something went wrong");
    }
  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
