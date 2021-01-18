import 'package:flutter/material.dart';

class LastNameField extends StatelessWidget {
  const LastNameField(this.controller);
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
        labelText: "Last Name",
      ),
    );
  }
}
