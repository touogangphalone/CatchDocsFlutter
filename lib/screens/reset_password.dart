import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/change_password';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate()) {
      // TODO: envoyer les informations au serveur pour changer le mot de passe
      // si la validation des champs est réussie
      // et revenir à la page précédente
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changer le mot de passe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFormField(
              //   controller: _oldPasswordController,
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     labelText: 'Mot de passe actuel',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Veuillez saisir votre mot de passe actuel';
              //     }
              //     // TODO: valider le mot de passe actuel
              //     return null;
              //   },
              // ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nouveau mot de passe',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un nouveau mot de passe';
                  }
                  // TODO: valider le nouveau mot de passe (longueur, complexité, etc.)
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmez le nouveau mot de passe',
                ),
                validator: (value) {
                  Navigator.pushNamed(context, '/login');
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer le nouveau mot de passe';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Les deux mots de passe ne correspondent pas';
                  } 
                  
                        
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
