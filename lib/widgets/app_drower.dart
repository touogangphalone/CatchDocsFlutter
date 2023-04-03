import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDrower extends StatelessWidget {
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
            Image.network(
              'https://images.unsplash.com/photo-1605821469603-6112b2cd8254?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=689&q=80',
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
                  Navigator.pushNamed(context, '/home/classe');
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
                  Navigator.pushNamed(context, '/home/cour');
              
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
                  Navigator.pushNamed(context, '/home/register');
              },
              child: ListTile(
                title: Text('Concours'),
                leading: Icon(Icons.work_sharp, color: Colors.lightBlue),
              ),
            ),
            Divider(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home/otp');
              },
              child: ListTile(
                title: Text('Nous contacter'),
                leading: Icon(Icons.contact_phone, color: Colors.blueGrey),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home/profile');
              },
              child: ListTile(
                title: Text('A propos de Nous'),
                leading: Icon(Icons.house, color: Colors.blueGrey),
              ),
            ),
            Spacer(),
            ListTile(
              onTap: () {
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
