import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'custom_alert_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text(
            "MakeMyCake",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.brown,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "MakeMyCake",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                        color: Colors.brown),
                  )),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'UserName',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: Colors.brown,
                    child: Text('SignUp'),
                    onPressed: () {
                      _signUp();
                    },
                  )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already user'),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        textColor: Colors.brown,
                        child: Text(
                          'Signin',
                          style: TextStyle(fontSize: 22),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _signUp() async {
    print("=== called ${password.text} ${email.text}");
    if (password.text.isNotEmpty && email.text.isNotEmpty) {
      print("=== called");
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        print("=== sign up success ${userCredential.user?.uid}");
        _showSnackBar("You have SuccessFully Sign Up");
        Navigator.pop(context);
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
