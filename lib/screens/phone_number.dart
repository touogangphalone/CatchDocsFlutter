import 'package:flutter/material.dart';

class PhoneNumberPage extends StatefulWidget {
  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrer votre numéro de téléphone'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Numéro de téléphone',
                  hintText: 'Entrez votre numéro de téléphone',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez entrer votre numéro de téléphone';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/otp-screnn');
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Navigator.pop(context, _phoneNumber);
                    }
                  },
                  child: Text('Enregistrer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
