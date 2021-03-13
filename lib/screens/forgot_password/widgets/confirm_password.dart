import 'package:flutter/material.dart';
import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField(this.controller);

  final TextEditingController controller;

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double heightFactor = height >= 1000 ? 1 : height / 1000;
    return TextFormField(
      controller: widget.controller,
      validator: _validator,
      style: TextStyle(
        color: C.primaryUnHighlightedColor,
        fontSize: D.inputFieldFontSize * heightFactor,
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context)..nextFocus()..nextFocus(),
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0.1),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: D.iconSize * heightFactor,
          color: C.primaryHighlightedColor,
        ),
        suffixIcon: IconButton(
          icon: IconTheme(
            child: _passwordVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            data: IconThemeData(color: C.primaryHighlightedColor, size: D.iconSize * heightFactor),
          ),
          onPressed: _togglePasswordVisibility,
        ),
        labelText: "Confirm Password",
      ),
    );
  }

  String _validator(String password) => password.isEmpty ? "" : null;

  void _togglePasswordVisibility() => setState(() => _passwordVisible = !_passwordVisible);
}
