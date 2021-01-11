import 'package:flutter/material.dart';

class MobileNumber extends StatelessWidget {
  const MobileNumber(this.controller);
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
        hintText: "Enter your 10 digit mobile number",
        labelText: "Mobile Number",
      ),
    );
  }
}
