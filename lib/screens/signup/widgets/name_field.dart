import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField(this.controller, this.label);
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validator,
      keyboardType: TextInputType.name,
      style: TextStyle(color: C.primaryUnHighlightedColor, fontSize: 20),
      textCapitalization: TextCapitalization.words,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0.1),
        prefixIcon: Icon(
          Icons.account_circle_outlined,
          size: D.iconSize,
          color: C.primaryHighlightedColor,
        ),
        labelText: label,
      ),
    );
  }

  String _validator(String name) => name.isEmpty ? "" : null;
}
