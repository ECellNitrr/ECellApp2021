import 'package:flutter/material.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixText: '*',
        suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
        border: OutlineInputBorder(),
        labelText: "First Name",
      ),
    );
  }
}
