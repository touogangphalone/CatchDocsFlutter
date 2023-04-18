import 'package:flutter/material.dart';

class AlertProvider extends ChangeNotifier {
  // Variables d'instance pour stocker les alertes et les fonctions de rappel.
  List<String> _items = [];
  List<Function> _callbacks = [];

  // Fonction pour ajouter une alerte à la liste des alertes.
  void remove() {
    _items.clear();
  }  
  void addItem(String item, Function callback) {
    _items.add(item);
    _callbacks.add(callback);
    notifyListeners();
  }

  // Fonction pour afficher une boîte de dialogue d'alerte avec les éléments de la liste et les fonctions de rappel.
void showAlertListToSelect(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _items.length,
              (index) => ListTile(
                title: Text(_items[index]),
                onTap: () {
                  Navigator.pop(context);
                  _callbacks[index]();
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}

  // Variables d'instance pour stocker les alertes.
  List<String> _alerts = [];

  // Fonction pour ajouter une alerte à la liste des alertes.
  void addAlert(String alert) {
    _alerts.add(alert);
    notifyListeners();
  }

  // Fonction pour afficher une boîte de dialogue d'alerte avec le message spécifié.
  void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  
  // Fonction pour afficher une boîte de dialogue d'alerte pour modifier le mot de passe.
void showChangePasswordAlert(BuildContext context) {
    String currentPassword = '';
    String newPassword = '';
    String confirmPassword = '';
    bool showCurrentPassword = false;
    bool showNewPassword = false;
    bool showConfirmPassword = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Changer le mot de passe'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) => currentPassword = value,
                    decoration: InputDecoration(
                      hintText: 'Mot de passe courant',
                    ),
                    obscureText: !showCurrentPassword,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) => newPassword = value,
                    decoration: InputDecoration(
                      hintText: 'Nouveau mot de passe',
                      suffixIcon: IconButton(
                        icon: Icon(
                          showNewPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => showNewPassword = !showNewPassword),
                      ),
                    ),
                    obscureText: !showNewPassword,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) => confirmPassword = value,
                    decoration: InputDecoration(
                      hintText: 'Confirmer le nouveau mot de passe',
                      suffixIcon: IconButton(
                        icon: Icon(
                          showConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => showConfirmPassword = !showConfirmPassword),
                      ),
                    ),
                    obscureText: !showConfirmPassword,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Enregistrer'),
                  onPressed: () {
                    if (currentPassword == '') {
                      showAlert(context,'Modifier mot de passe', 'Veuillez saisir votre mot de passe courant.');
                    } else if (newPassword == '') {
                      showAlert(context,'Modifier mot de passe', 'Veuillez saisir votre nouveau mot de passe.');
                    } else if (newPassword.length < 4 || confirmPassword.length < 4) {
                      showAlert(context,'Modifier mot de passe', 'Les mots de passe doivent contenir au moins 4 caractères.');
                    } else if (newPassword != confirmPassword) {
                      showAlert(context,'Modifier mot de passe', 'Les mots de passe ne correspondent pas.');
                    } else {
                      // Enregistrer le nouveau mot de passe ici
                      // ...
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }


  String _username = "John Doe";
  String _email = "john.doe@example.com";
  String _avatarUrl = "https://example.com/avatar.jpg";

  String get username => _username;
  String get email => _email;
  String get avatarUrl => _avatarUrl;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setAvatarUrl(String avatarUrl) {
    _avatarUrl = avatarUrl;
    notifyListeners();
  }

  void showEditProfileDialog(BuildContext context) {
    String username = _username;
    String email = _email;
    String avatarUrl = _avatarUrl;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Modifier le profil'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nom d\'utilisateur',
                    ),
                    onChanged: (value) => username = value,
                    // initialValue: _username,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onChanged: (value) => email = value,
                    // initialValue: _email,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'URL de l\'avatar',
                    ),
                    onChanged: (value) => avatarUrl = value,
                    // initialValue: _avatarUrl,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Enregistrer'),
                  onPressed: () {
                    setUsername(username);
                    setEmail(email);
                    setAvatarUrl(avatarUrl);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  }