import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// would be the title of the field
class NameField extends StatelessWidget {
  const NameField(this.controller, this.title);

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixText: '*',
        suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
        border: OutlineInputBorder(),
        labelText: title,
      ),
    );
  }
}
