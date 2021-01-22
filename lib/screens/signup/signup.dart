import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/screens/signup/widgets/name_field.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/res/colors.dart';
import '../../core/res/strings.dart';
import 'cubit/signup_cubit.dart';
import 'widgets/email_field.dart';
import 'widgets/mobile_number_field.dart';
import 'widgets/password_field.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is SignupSuccess) {
            // TODO
          }
        },
        builder: (context, state) {
          if (state is SignupInitial) {
            return _buildInitial(context);
          } else if (state is SignupLoading) {
            return _buildLoading();
          } else if (state is SignupSuccess) {
            return _buildSuccess();
          } else {
            return _buildInitial(context);
          }
        },
      ),
    );
  }

  Widget _buildInitial(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTextStyle(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          ScreenBackground(elementId: 1),
          Column(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 25),
                      child: Image.asset(S.assetEcellLogoWhite, width: width * 0.25),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 25, top: 20),
                      child: Text(
                        "Hello!",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 25, top: 5),
                      child: RichText(
                        text: TextSpan(
                          text: "Let's create your ",
                          children: [
                            TextSpan(
                                text: "Account", style: TextStyle(color: C.primaryHighlightedColor))
                          ],
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(child: NameField(firstnameController, "First Name")),
                                SizedBox(width: 15),
                                Expanded(child: NameField(lastnameController, "Last Name")),
                              ],
                            ),
                            SizedBox(height: 20),
                            EmailField(emailController),
                            SizedBox(height: 20),
                            PasswordField(passwordController),
                            SizedBox(height: 20),
                            MobileNumberField(mobileController),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 25),
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: C.authButtonColor.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(0, 12),
                        )
                      ],
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      color: C.authButtonColor,
                      onPressed: () => _signup(context),
                      child: Container(
                        height: 50,
                        width: 90,
                        alignment: Alignment.center,
                        child: Text(
                          "Sign Up!",
                          style: TextStyle(color: C.primaryUnHighlightedColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: width / 8, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "have an account?",
                        style: TextStyle(fontSize: 18, color: C.secondaryColor),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: Text(
                          "Login now",
                          style: TextStyle(fontSize: 20, color: C.primaryHighlightedColor),
                        ),
                        onTap: () {
                          // TODO
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildSuccess() => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.check_circle_outline),
            Text("User Signup Successful!", textAlign: TextAlign.center),
          ],
        ),
      );

  void _signup(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    if (_formKey.currentState.validate())
      cubit.signup(
        firstnameController.text,
        lastnameController.text,
        emailController.text,
        mobileController.text,
        passwordController.text,
      );
  }
}
