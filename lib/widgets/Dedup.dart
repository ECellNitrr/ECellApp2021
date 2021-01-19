import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//This would return a field which would be used to accept an email as an input
class EmailField extends StatelessWidget {
  const EmailField(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: _validateEmail,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
          hintText: "example@email.com",
          labelText: "Email",
        ),
      ),
    );
  }

  String _validateEmail(String email) {
    RegExp emailRegx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.isEmpty || !emailRegx.hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }
}

// This would return a field which would be used to accept a password as an input
class PasswordField extends StatefulWidget {
  const PasswordField(this.controller);

  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        validator: _validatePassword,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: _passwordVisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            onPressed: _togglePasswordVisibility,
          ),
          border: OutlineInputBorder(),
          hintText: "p@ssw0rd",
          labelText: "Password",
        ),
      ),
    );
  }

  String _validatePassword(String password) {
    if (password.isEmpty) return "Please enter password";
    return null;
  }

  void _togglePasswordVisibility() =>
      setState(() => _passwordVisible = !_passwordVisible);
}

// this would return a simple field for any input. Along with the controller, we need to pass a string which
// would be the title of the field
class NameField extends StatelessWidget {
  const NameField(this.controller, this.title);

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixText: '*',
        suffixStyle: TextStyle(color: Colors.red, fontSize: 20),
        border: OutlineInputBorder(),
        labelText: title,
      ),
    );
  }
}
