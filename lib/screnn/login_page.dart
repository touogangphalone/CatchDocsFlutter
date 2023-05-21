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
      Navigator.pushNamed(context, '/home'); //------
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
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
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
