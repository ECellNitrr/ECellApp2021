import 'package:ecellapp/screens/signup/cubit/signup_cubit.dart';
import 'package:ecellapp/screens/signup/widgets/email_field.dart';
import 'package:ecellapp/screens/signup/widgets/name_field.dart';
import 'package:ecellapp/screens/signup/widgets/password_field.dart';
import 'package:ecellapp/screens/signup/widgets/mobile_number_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is SignupInitial) {
            return _buildInitial(context);
          } else if (state is SignupLoading) {
            return _buildLoading();
          } else if (state is SignupSuccess) {
            // TODO add on success logic
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
              child: NameField(nameController),
            ),
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
              child: MobileNumberField(mobileController),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: RaisedButton(
                onPressed: () => _signup(context),
                child: Text("Sign Up"),
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
            "User Signup Successful!",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _signup(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    if (_formKey.currentState.validate())
      cubit.signup(nameController.text, emailController.text, passwordController.text,
          int.parse(mobileController.text));
  }
}
