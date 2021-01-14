import 'package:flutter/material.dart';

class MobileNumberField extends StatelessWidget {
  const MobileNumberField(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixText: '*',
        suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
        labelText: "Mobile Number",
      ),
    );
  }
}
