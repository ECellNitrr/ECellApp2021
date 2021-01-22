import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:flutter/material.dart';

class MobileNumberField extends StatelessWidget {
  const MobileNumberField(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validator,
      keyboardType: TextInputType.number,
      style: TextStyle(color: C.primaryUnHighlightedColor, fontSize: 20),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0.1),
        prefixIcon: Icon(Icons.phone_outlined, size: D.iconSize, color: C.primaryHighlightedColor),
        labelText: "Mobile Number",
      ),
    );
  }

  String _validator(String number) => number.isEmpty ? "" : null;
}
