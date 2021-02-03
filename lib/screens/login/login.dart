import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/email_field.dart';
import '../../widgets/password_field.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            await Future.delayed(Duration(seconds: 1));
            // ignore: todo
            //TODO: Navigator->Home()
          } else if (state is LoginError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
            return _buildInitial(context);
          } else if (state is LoginLoading) {
            return _buildLoading();
          } else if (state is LoginSuccess) {
            return _buildSuccess();
          } else {
            return _buildInitial(context);
          }
        },
      ),
    );
  }

  Widget _buildInitial(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: EmailField(emailController),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: PasswordField(passwordController),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: RaisedButton(
                onPressed: () => _login(context),
                child: Text("Login"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                onPressed: () {
                  print("BUTTON PRESS");
                },
                child: Text("SignUp"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.check_circle_outline),
          Text(
            "User Login Successful!",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (_formKey.currentState.validate())
      cubit.login(emailController.text, passwordController.text);
  }
}
