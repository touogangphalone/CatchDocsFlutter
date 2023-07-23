import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context, String email, String pass) async {
    print("email = $email");
    print("pass = $pass");
    final String apiUrl = "http://192.168.248.227:8000/api/login";
    var response = await http.post(Uri.parse(apiUrl), body: {
      "email": email,
      "password": pass,
    });
    print(" STATUS CODE DATA :${response.statusCode}");
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      print("${body}");
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('user', json.encode(body));
      Navigator.pushNamed(context, '/home'); //------
    } else if (response.statusCode == 401) {
      var body = jsonDecode(response.body);
      print(body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(body['message']),
          backgroundColor: Colors.red,
        ),
      );
    } else if (response.statusCode == 409) {
      var body = jsonDecode(response.body);
      print(body);
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bienvenue Sur CatchDocs'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Adresse e-mail',
                icon: Icon(
                  Icons.email_outlined,
                  color: Colors.blue,
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                labelText: 'Mot de passe',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () =>
                  login(context, emailController.text, passwordController.text),
              //Navigator.pushNamed(context, '/home'), //------
              child: Text('Se connecter'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(
                  horizontal: 90,
                  vertical: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
