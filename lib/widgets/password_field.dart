import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(this.controller);

  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: _validator,
      style: TextStyle(color: C.primaryUnHighlightedColor, fontSize: 20),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      textInputAction: TextInputAction.next,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0.1),
        prefixIcon: Icon(Icons.lock_outline, size: D.iconSize, color: C.primaryHighlightedColor),
        suffixIcon: IconButton(
          icon: IconTheme(
            child: _passwordVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            data: IconThemeData(color: C.primaryUnHighlightedColor, size: D.iconSize),
          ),
          onPressed: _togglePasswordVisibility,
        ),
        labelText: "Password",
      ),
    );
  }

  String _validator(String password) => password.isEmpty ? "" : null;

  void _togglePasswordVisibility() => setState(() => _passwordVisible = !_passwordVisible);
}
