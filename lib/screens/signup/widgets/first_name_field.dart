import 'package:flutter/material.dart';

class FirstName extends StatelessWidget {
  const FirstName(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        suffixText: '*',
        suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
        border: OutlineInputBorder(),
        hintText: "Enter your first name",
        labelText: "First Name",
      ),
    );
  }
}
