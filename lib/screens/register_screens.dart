import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizstar/screens/style/theme.dart';

class RegisterScreens extends StatefulWidget {
  static const routeName = '/register-screens';
  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  String _username;
  String _password;
  String _confPassword;
  String _regions = 'ouest';
  final _form = GlobalKey<FormState>();

  List items = ["ouest", "centre", "Nord", "sud"];
  /*String profiletitle;
  final profileControler = TextEditingController();

  void addprofile() {
    if (profiletitle.length <= 0) {
      return;
    }
    Provider.of<PostsState>(context, listen: false).addprofile(profiletitle);
    print(profiletitle);
    profileControler.text;
    profiletitle;
    setState(() {});
  }*/

  /*void _registerNow() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool isRegister = await Provider.of<PostsState>(context, listen: false)
        .registerNow(_username, _confPassword, _regions);
    if (isRegister == false) {
      Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Somthing is Wrong!Try Again"),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    //final itemss = Provider.of<PostsState>(context).profile;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Camschool"),
        centerTitle: true,
        backgroundColor: blueColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _form,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.003),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.2,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  child: DropdownButtonFormField(
                    //controller: profileControler,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.select_all,
                        color: blueColor,
                      ),
                      labelText: "selectionner la region",
                    ),
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    value: _regions,
                    onChanged: (newvalue) {
                      setState(() {
                        _regions = newvalue;
                      });
                    },
                    items: items.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  ),
                ),

                /* TextFormField(
                  //controller: profileControler,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: blueColor,
                    ),
                    labelText: "region",
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'region';
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _regions = v;
                  },
                ), */
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: blueColor,
                    ),
                    labelText: "Nom",
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter votre Nom';
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _username = v;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: blueColor,
                    ),
                    labelText: "Prenom",
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter votre Prenom';
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _username = v;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: blueColor,
                    ),
                    labelText: "phone_number",
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'phone number is required';
                    }
                    return null;
                  },
                  onChanged: (v) {
                    setState(() {
                      _password = v;
                    });
                  },
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: blueColor,
                    ),
                    labelText: "Etablissement",
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return "classe";
                    }
                    if (_password != v) {
                      return 'Etablissement';
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _confPassword = v;
                  },
                  obscureText: true,
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: blueColor,
                      onPressed: () {
                        //_registerNow();
                        print("register");
                      },
                      child: Text("Register"),
                    ),
                    FlatButton(
                      onPressed: () {
                        /*Navigator.of(context)
                            .pushReplacementNamed(LoginScreens.routeName);*/
                      },
                      child: Text("Login Now"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
