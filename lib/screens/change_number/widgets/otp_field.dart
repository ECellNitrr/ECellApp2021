import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;

  OtpField(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}
