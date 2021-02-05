import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/widgets/email_field.dart';
import 'package:ecellapp/widgets/password_field.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double heightFactor = height / 1000;
    if (_scrollController.hasClients) {
      if (bottom > height * 0.25) {
        _scrollController.animateTo(
          bottom - height * 0.25,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    }
    return DefaultTextStyle(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          //Handles background elements
          ScreenBackground(
            elementId: 1,
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Container(
              height: height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Space for clouds
                  Expanded(
                    child: Container(),
                    flex: 2,
                  ),
                  //Contains all fields
                  Flexible(
                      child: Column(
                        children: [
                          // Logo
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: D.horizontalPadding + 1),
                            child: Image.asset(
                              S.assetEcellLogoWhite,
                              width: width * 0.25 * heightFactor,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: D.horizontalPadding, top: 20),
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 35 * heightFactor, fontWeight: FontWeight.w600),
                            ),
                          ),
                          //Text Greeting
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: D.horizontalPadding, top: 5),
                            child: RichText(
                              text: TextSpan(
                                text: "Let's ",
                                children: [
                                  TextSpan(
                                      text: "Sign ",
                                      style: TextStyle(color: C.primaryHighlightedColor)),
                                  TextSpan(
                                      text: "you in",
                                      style: TextStyle(color: C.primaryUnHighlightedColor)),
                                ],
                                style: TextStyle(fontSize: 25 * heightFactor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      flex: 4),
                  //Form

                  Flexible(
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: D.horizontalPadding),
                          child: Column(
                            children: [
                              SizedBox(height: 10 * heightFactor),
                              EmailField(emailController),
                              SizedBox(height: 30 * heightFactor),
                              PasswordField(passwordController),
                              SizedBox(height: 10 * heightFactor),
                            ],
                          ),
                        )),
                    flex: 4,
                  ),
                  //Redirect to Forgot Password

                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(right: D.horizontalPadding),
                        alignment: Alignment.topRight,
                        child: RichText(
                          text: TextSpan(text: "Forgot Password?"),
                        ),
                      )),

                  //LoginButton
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: D.horizontalPadding),
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
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          color: C.authButtonColor,
                          onPressed: () => _login(context),
                          child: Container(
                            height: 60,
                            width: 120,
                            alignment: Alignment.center,
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: C.primaryUnHighlightedColor,
                                fontSize: 20 * heightFactor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //New here Text
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: width / 8, top: 5),
                      child: RichText(
                        text: TextSpan(
                          text: "New here? ",
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: C.primaryHighlightedColor)),
                          ],
                          style: TextStyle(fontSize: 25 * heightFactor),
                        ),
                      ),
                    ),
                  ),
                  //To flex background
                  Expanded(flex: 3, child: Container()),
                ],
              ),
            ),
          )
        ],
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
