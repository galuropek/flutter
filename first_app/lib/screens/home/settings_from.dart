import 'package:flutter/material.dart';
import 'package:first_app/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                  child: Text('$sugar sugars'), value: sugar);
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),
          //slider
          Slider(
              value: (_currentStrength ?? 100).toDouble(),
              activeColor: Colors.brown[_currentStrength ?? 100],
              inactiveColor: Colors.brown[_currentStrength ?? 100],
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) =>
                  setState(() => _currentStrength = val.round())),
          // button
          RaisedButton(
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
            color: Colors.orange,
            child: Text('Update', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
