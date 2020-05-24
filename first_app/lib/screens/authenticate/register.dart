import 'package:first_app/services/auth.dart';
import 'package:first_app/shared/constants.dart';
import 'package:first_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        title: Text('Sing up to My First App'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign in'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
            child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.pink,
              child: Text('Register', style: TextStyle(color: Colors.white70)),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                  if (result == null){
                    setState(() {
                      error = 'please supply a valid email';
                      loading = false;
                    });
                  }
                }
              },
            ),
            SizedBox(height: 12.0),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
          ],
        )),
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//        child: RaisedButton(
//          child: Text('Sign in anon'),
//          onPressed: () async {
//            dynamic result = await _auth.signInAnon();
//            if (result == null) {
//              print('error sign in');
//            } else {
//              print('signed in');
//              print(result.uid);
//            }
//          },
//        ),
      ),
    );
  }
}
