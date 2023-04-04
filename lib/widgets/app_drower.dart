import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDrower extends StatelessWidget {
  // Ajouter un constructeur avec un paramètre d'image de profil
  const AddDrower({Key key,  this.profileImage}) : super(key: key);
  final String profileImage; // Le lien vers l'image de profil de l'utilisateur

  @override
  Widget build(BuildContext context) {
    
    // LocalStorage storage = LocalStorage("usertoken");
    _logoutnow() {
        Navigator.pushNamed(context, '/');
      // storage.clear();
      // Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
    }

    return Container(
      child: Drawer(
        
        child: Column(
          children: [
          Container(
          alignment: Alignment.centerRight,
          child: UserAccountsDrawerHeader(
            accountName: Text("Nom de l'utilisateur"),
            accountEmail: Text("Email de l'utilisateur"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1605821469603-6112b2cd8254?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=689&q=80'),
            ),
          ),
        ),
            Text(
              "CamSchool",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Divider(
              height: 9,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // Fermer le menu
                  Navigator.pushNamed(context, '/home');
              },
              child: ListTile(
                title: Text('Home'),
                leading: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // Fermer le menu
                  Navigator.pushNamed(context, '/profile');
              
                /*Navigator.of(context)
                    .pushReplacementNamed(UserProfileScreens.routeName);*/
              },
              child: ListTile(
                title: Text('Profile'),
                leading: Icon(Icons.person_add, color: Colors.blue),
              ),
            ),
            Divider(
              height: 12,
            ),
            Divider(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // Fermer le menu
                  Navigator.pushNamed(context, '/concour');
              },
              child: ListTile(
                title: Text('Concours'),
                leading: Icon(Icons.work_sharp, color: Colors.lightBlue),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // Fermer le menu
                  Navigator.pushNamed(context, '/forum');
              },
              child: ListTile(
                title: Text('Forum'),
                leading: Icon(Icons.forum, color: Colors.lightBlue),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // Fermer le menu
                  Navigator.pushNamed(context, '/admin');
              },
              child: ListTile(
                title: Text('Sinistre'),
                leading: Icon(Icons.error, color: Colors.lightBlue),
              ),
            ),
            Divider(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // Fermer le menu
                Navigator.pushNamed(context, '/contactez');
              },
              child: ListTile(
                title: Text('Nous contacter'),
                leading: Icon(Icons.contact_phone, color: Colors.blueGrey),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // Fermer le menu
                Navigator.pushNamed(context, '/apropos');
              },
              child: ListTile(
                title: Text('A propos de Nous'),
                leading: Icon(Icons.house, color: Colors.blueGrey),
              ),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                _logoutnow();
              },
              trailing: Icon(
                Icons.logout,
                color: Theme.of(context).accentColor,
              ),
              title: Text("Deconexion"),
            ),
          ],
        ),
      ),
    );
  }

  LocalStorage(String s) {}
}
