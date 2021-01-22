import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: C.primaryUnHighlightedColor, fontSize: 20),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      validator: _validator,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0.1),
        prefixIcon: Icon(Icons.email_outlined, size: D.iconSize, color: C.primaryHighlightedColor),
        labelText: "Email",
      ),
    );
  }

  String _validator(String email) => email.isEmpty ? "" : null;
}
