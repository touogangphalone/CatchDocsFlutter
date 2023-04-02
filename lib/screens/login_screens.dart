import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizstar/screens/style/theme.dart';
import 'dart:async';
import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:xml/xml.dart' as xml;
// import 'package:flutter_appavailability/flutter_appavailability.dart';
// import 'package:package_info/package_info.dart';

class LoginScreens extends StatefulWidget {
  static const routeName = '/login-screens';
  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final _form = GlobalKey<FormState>();
  //String _username;
  //String _password;

  void _loginNow() async {
    Navigator.pushNamed(context, '/home');
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    // bool islogin = await Provider.of<PostsState>(context, listen: false)
    //     .loginNow(_username, _password);
    // print(_username);
    // print(_password);
    // if (!islogin) {
    //   Navigator.of(context).pushReplacementNamed(HomeScreens.routName);
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text("Somthing is Wrong!Try Again"),
    //         actions: [
    //           RaisedButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text("Ok"),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Camschool",
        ),
        centerTitle: true,
        backgroundColor: blueColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                TextFormField(
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter your Username';
                    }
                    return null;
                  },
                  /*onSaved: (v) {
                    _username = v;
                  },*/
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: blueColor,
                    ),
                    labelText: "Username",
                  ),
                  cursorColor: blueColor,
                ),
                TextFormField(
                  cursorColor: blueColor,
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter your Password';
                    }
                    return null;
                  },
                  /* onSaved: (v) {
                    _password = v;
                  },*/
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: blueColor,
                    ),
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: blueColor,
                      onPressed: () {
                        _loginNow();
                        print("pressed");
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(width: size.height * 0.03),
                    FlatButton(
                      onPressed: () {
                        /*Navigator.of(context)
                            .pushReplacementNamed(RegisterScreens.routeName);*/
                        Navigator.pushNamed(context, '/resgister');
                        print("bonjour");
                      },
                      child: Text("Register Now"),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                SizedBox(height: size.height * 0.03),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        "mot de passe oublié?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 85, 153, 209)),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
