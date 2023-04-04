import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quizstar/screens/style/theme.dart';

class OtpScrenn extends StatefulWidget {
  //const OtpScrenn({Key? key}) : super(key: key);
  static const routeName = '/otp-screens';

  @override
  State<OtpScrenn> createState() => _OtpScrennState();
}

class _OtpScrennState extends State<OtpScrenn> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrez le code que vous avez reçu par SMS'),
      ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Entrer Votre Code Pin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: 300.0,
                  //height: Win
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      color: blueColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/reset-password');
                        print("resend otp");
                      },
                      child: Text("renvoyer le code"),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
