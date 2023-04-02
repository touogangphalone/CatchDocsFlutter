import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPasswordController;
  TextEditingController _newPasswordController;
  TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Changer le mot de passe'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Entrez votre mot de passe actuel',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Mot de passe actuel',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Entrez votre nouveau mot de passe',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nouveau mot de passe',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Confirmez votre nouveau mot de passe',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Confirmer mot de passe',
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // Do something when the button is pressed
                },
                child: const Text('Changer le mot de passe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
