import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {

   @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> { //underscore is private

  final formkey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } 
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try { 
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        print('Signed in: ${user.user.uid}');
      }
      catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    
  }


  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Container(
        padding: EdgeInsets.all(17.0),
        child: new Form(
          key: formkey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email'),
                validator: (value) => value.isEmpty ? 'Email field is empty' : null,
                onSaved: (value) => _email = value,
              ), // TextFormField
              new TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) => value.isEmpty ? 'Password field is empty' : null,
                onSaved: (value) => _password = value,
              ), // TextFormField
              new RaisedButton(
                child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
                onPressed: validateAndSubmit,
              ), // RasiedButton
              new FlatButton(
                child: new Text('Sign Up for StayFit', style: new TextStyle(fontSize: 20.0)),
                onPressed: moveToRegister,
              ) // Text
            ], // <Widget>
          ) // Column
          ) // Form
      ) // Container
    );
  }
}