import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/screens/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:ecellapp/screens/forgot_password/widgets/keyboard.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/email_field.dart';
import 'package:ecellapp/widgets/password_field.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/confirm_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();

  String otp1 = "", otp2 = "", otp3 = "", otp4 = "", otpEntered = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              ScreenBackground(elementId: 0),
              if (state is ForgotEmailInitial)
                _initialForgotPassword(context, state)
              else if (state is ForgotLoading)
                _buildLoading(context)
              else if (state is ForgotOTPInitial)
                _enterOTP(context, state)
              else if (state is ForgotPasswordError)
                _uiUpdateForNetworkError(context, state.state)
              else if (state is ForgotResetInitial)
                _resetPassword(context, state)
              else if (state is ForgotResetSuccess)
                _passwordResetSuccess()
              else
                _initialForgotPassword(context, state)
            ],
          );
        },
      ),
    );
  }

  Widget _uiUpdateForNetworkError(BuildContext context, ForgotPasswordState state) {
    if (state is ForgotEmailInitial) {
      return _initialForgotPassword(context, state);
    } else if (state is ForgotOTPInitial) {
      return _enterOTP(context, state);
    } else if (state is ForgotPasswordError) {
      return _enterOTP(context, state);
    } else if (state is ForgotResetInitial) {
      return _resetPassword(context, state);
    } else {
      return _initialForgotPassword(context, state);
    }
  }

  ///Initial Forgot Password
  Widget _initialForgotPassword(BuildContext context, ForgotPasswordState state) {
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
          ScreenBackground(elementId: 1),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Container(
              height: height * 1.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, heightFactor * 100, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          "Step 1/3",
                          style:
                              TextStyle(fontSize: 35 * heightFactor, fontWeight: FontWeight.w600),
                        ),
                      )),
                  Flexible(
                    flex: 7,
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
                            style:
                                TextStyle(fontSize: 35 * heightFactor, fontWeight: FontWeight.w600),
                          ),
                        ),
                        //Text Greeting
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: D.horizontalPadding, top: 5),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Forgot your ",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontWeight: FontWeight.w300)),
                                TextSpan(
                                  text: "Password ",
                                  style: TextStyle(color: C.primaryHighlightedColor),
                                ),
                                TextSpan(
                                    text: "? \n",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontWeight: FontWeight.w300)),
                                TextSpan(
                                    text:
                                        "We got you covered.\nJust enter your registered email address.",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontWeight: FontWeight.w300)),
                              ],
                              style: TextStyle(fontSize: 25 * heightFactor),
                            ),
                          ),
                        ),
                        SizedBox(height: 23 * heightFactor),
                        Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: D.horizontalPadding),
                              child: Column(
                                children: [
                                  EmailField(emailController),
                                  SizedBox(height: 20 * heightFactor),
                                  SizedBox(height: 10 * heightFactor),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
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
                          onPressed: () => _sendOTP(context, state),
                          child: Container(
                            height: 60,
                            width: 120,
                            alignment: Alignment.center,
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: C.primaryUnHighlightedColor, fontSize: 20 * heightFactor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //To flex background
                  Expanded(flex: 9, child: Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(child: ECellLogoAnimation(size: width / 2));
  }

  Widget _enterOTP(BuildContext context, ForgotPasswordState state) {
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
          //background
          ScreenBackground(elementId: 0),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Container(
              height: height * 1.00,
              child: Column(
                children: [
                  // The text part od the screen
                  Flexible(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, heightFactor * 100, 0, 0),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Step 2/3",
                              style: TextStyle(
                                  fontSize: 40 * heightFactor, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.verified_user,
                                color: Colors.white, size: 65 * heightFactor),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Verify OTP",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: C.primaryHighlightedColor,
                                  fontSize: heightFactor * 30,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(heightFactor * 10, 0, heightFactor * 10, 0),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  "An otp has been sent to the registered user",
                                  style: TextStyle(
                                    fontSize: heightFactor * 20,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 10 * heightFactor),
                                    child: Text(
                                      "email",
                                      style: TextStyle(
                                        fontSize: heightFactor * 20,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        //!OTP number fields
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    otp1,
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: C.firstRing,
                                    width: 2.5,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    otp2,
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: C.secondRing,
                                    width: 2.5,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    otp3,
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: C.thirdRing,
                                    width: 2.5,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    otp4,
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: C.fourthRing,
                                    width: 2.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "You can request another OTP in ",
                              children: [
                                TextSpan(
                                    text: "[Time]",
                                    style: TextStyle(
                                      color: C.primaryUnHighlightedColor,
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: "s",
                                    style: TextStyle(
                                      color: C.primaryUnHighlightedColor,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ],
                              style: TextStyle(
                                  fontSize: 15 * heightFactor, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),

                        SizedBox(height: 30 * heightFactor),
                        //!Verify button
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                boxShadow: [
                                  BoxShadow(
                                    color: C,
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
                                onPressed: () => _verifyOtp(context, state),
                                child: Container(
                                  height: 60,
                                  width: 120,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontSize: 20 * heightFactor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20 * heightFactor,
                            ),
                            Container(
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
                                onPressed: () => _verifyOtp(context, state),
                                child: Container(
                                  height: 60,
                                  width: 120,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontSize: 20 * heightFactor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: NumericPad(onNumberSelected: _onNumSelected),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordResetSuccess() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Text("success"),
    );
  }

  Widget _resetPassword(BuildContext context, ForgotPasswordState state) {
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double heightFactor = height / 1000;
    if (_scrollController.hasClients) {
      if (bottom > height * 0.5) {
        _scrollController.animateTo(
          bottom - height * 0.5,
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
          //background
          ScreenBackground(elementId: 0),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Container(
              height: height * 1.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //3/3 text
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, heightFactor * 100, 0, 0),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            "Step 3/3",
                            style:
                                TextStyle(fontSize: 35 * heightFactor, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 23 * heightFactor),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                color: C.primaryHighlightedColor,
                                fontSize: heightFactor * 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 23 * heightFactor),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Please enter new password",
                              style: TextStyle(
                                fontSize: heightFactor * 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // password and confirm password fields
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PasswordField(passwordController),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ConfirmPasswordField(confirmPasswordController),
                          ),
                          SizedBox(height: 20 * heightFactor),
                          Container(
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
                                onPressed: () => _changePassword(context, state),
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Reset Password",
                                    style: TextStyle(
                                        color: C.primaryUnHighlightedColor,
                                        fontSize: 20 * heightFactor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendOTP(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.sendOTP(emailController.text, state);
  }

  void _verifyOtp(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.checkOTP(otpEntered.substring(0, 4), state, emailController.text);
  }

  void _changePassword(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.changePassword(emailController.text, otpEntered.substring(0, 4), passwordController.text,
        confirmPasswordController.text, state);
  }

  void updateOTPBlocks() {
    int length = otpEntered.length;
    if (length == 0) {
      otp1 = "";
      otp2 = "";
      otp3 = "";
      otp4 = "";
    } else if (length == 1) {
      otp1 = otpEntered[0];
      otp2 = "";
      otp3 = "";
      otp4 = "";
    } else if (length == 2) {
      otp1 = otpEntered[0];
      otp2 = otpEntered[1];
      otp3 = "";
      otp4 = "";
    } else if (length == 3) {
      otp1 = otpEntered[0];
      otp2 = otpEntered[1];
      otp3 = otpEntered[2];
      otp4 = "";
    } else {
      otp1 = otpEntered[0];
      otp2 = otpEntered[1];
      otp3 = otpEntered[2];
      otp4 = otpEntered[3];
      otpEntered = otpEntered.substring(0, 4);
    }
  }

  _onNumSelected(int p1) {
    print("$p1");
  }
}
