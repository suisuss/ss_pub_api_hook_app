import 'package:flutter/material.dart';

// Creating a widget
class TextSection extends StatelessWidget {
  final String _name; // Final makes it so this can't be changed
  final String _dateSubmitted;
  final String _phone;
  final String _email;
  final String _body;
  static const double _hPad = 16.0;

  TextSection(
      this._name, this._dateSubmitted, this._phone, this._email, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 16.0, _hPad, 16.0),
            child: Text(_name, style: Theme.of(context).textTheme.bodyText1),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 16.0, _hPad, 16.0),
            child: Text(_phone, style: Theme.of(context).textTheme.bodyText1),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 16.0, _hPad, 16.0),
            child: Text(_email, style: Theme.of(context).textTheme.bodyText1),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 16.0, _hPad, 16.0),
            child: Text(_dateSubmitted,
                style: Theme.of(context).textTheme.bodyText1),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, 4.0),
              child: Text(_body, style: Theme.of(context).textTheme.bodyText1)),
        ]);
  }
}
