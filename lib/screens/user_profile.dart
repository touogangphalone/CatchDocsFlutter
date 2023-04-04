import 'package:flutter/material.dart';
import 'package:quizstar/widgets/app_drower.dart';

class UserProfile extends StatefulWidget {
  // const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Définir les champs de l'utilisateur
  String _nom = "Dupont";
  String _prenom = "Jean";
  String _dateNaissance = "01/01/1990";
  String _email = "jean.dupont@mail.com";
  String _password = "password";
  String _imageUrl = "assets/icons/signup.svg";

  // Définir la méthode pour modifier le mot de passe
  void _changePassword() {
    // Implémenter la logique pour modifier le mot de passe ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AddDrower(),
    appBar: AppBar(
      title: Text('Profile'),
    ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Afficher l'image de profil de l'utilisateur
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1605821469603-6112b2cd8254?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=689&q=80'),
            // backgroundImage: NetworkImage(_imageUrl),
          ),
          SizedBox(height: 20),
          // Afficher les informations de l'utilisateur
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Nom: $_nom"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Prénom: $_prenom"),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text("Date de naissance: $_dateNaissance"),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text("Email: $_email"),
          ),
          // Bouton pour changer le mot de passe
          ElevatedButton(
            onPressed: _changePassword,
            child: const Text("Changer le mot de passe"),
          ),
        ],
      ),
    );
  }
}
