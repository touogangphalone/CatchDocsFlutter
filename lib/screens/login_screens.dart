import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizstar/screens/style/theme.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreens extends StatefulWidget {
  static const routeName = '/login-screens';
  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final _form = GlobalKey<FormState>();
  String _username;
  String _password;
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _loginNow() async {
    Navigator.pushNamed(context, '/home');
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
  }


  Future<void> login(BuildContext context) async {
    final String apiUrl = "http://127.0.0.1:8000/login";
    var response = await http.post(Uri.parse(apiUrl), body: {
      "email": emailController.text,
      "password": passwordController.text
    });

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      SharedPreferences localStorage =
          await SharedPreferences.getInstance();
      localStorage.setString('user', json.encode(body));
      Navigator.pushNamed(context, '/home');
    } else if (response.statusCode == 401) {
      var body = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(body['message']),
          backgroundColor: Colors.red,
        ),
      );
    } else if (response.statusCode == 409) {
      var body = jsonDecode(response.body);
      String message = '';
      for (var item in body) {
        message += item + '\n';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Une erreur s'est produite!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CatchDocs",
        ),
        centerTitle: true,
        backgroundColor: blueColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.jpeg",
                  height: size.height * 0.35,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Adresse e-mail",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer votre adresse e-mail";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer votre mot de passe";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                    login(context);
                },
                child: Text("Connexion"),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
 }

// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:scan_doc/screens/style/theme.dart';

// class LoginScreens extends StatefulWidget {
//   static const routeName = '/login-screens';
//   _LoginScreensState createState() => _LoginScreensState();
// }

// class _LoginScreensState extends State<LoginScreens> {
//   final _form = GlobalKey<FormState>();
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();


//   Future<void> login(BuildContext context) async {
//     final String apiUrl = "http://127.0.0.1:8000/login";
//     var response = await http.post(Uri.parse(apiUrl), body: {
//       "email": emailController.text,
//       "password": passwordController.text
//     });

//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       SharedPreferences localStorage =
//           await SharedPreferences.getInstance();
//       localStorage.setString('user', json.encode(body));
//       Navigator.pushNamed(context, '/home');
//     } else if (response.statusCode == 401) {
//       var body = jsonDecode(response.body);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(body['message']),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } else if (response.statusCode == 409) {
//       var body = jsonDecode(response.body);
//       String message = '';
//       for (var item in body) {
//         message += item + '\n';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Une erreur s'est produite!"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "CatchDocs",
//         ),
//         centerTitle: true,
//         backgroundColor: blueColor,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//                 SizedBox(height: size.height * 0.03),
//                 SvgPicture.asset(
//                   "assets/icons/login.jpeg",
//                   height: size.height * 0.35,
//                 ),
//                 Text(
//                   "Login",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: size.height * 0.03),
//               TextFormField(
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: "Adresse e-mail",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Veuillez entrer votre adresse e-mail";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Mot de passe",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Veuillez entrer votre mot de passe";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     login(context);
//                   }
//                 },
//                 child: Text("Connexion"),
//               ),
//             ],
//           ),
//         ),
//         ),
//       ),
//     );
//   }
// }