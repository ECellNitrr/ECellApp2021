import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/screens/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:ecellapp/widgets/password_field.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/confirm_password.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    Key key,
    this.onConfirm,
    this.passwordController,
    this.confirmPasswordController,
  }) : super(key: key);
  final Function onConfirm;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double heightFactor = height / 1000;
    if (scrollController.hasClients) {
      if (bottom > height * 0.5) {
        scrollController.animateTo(
          bottom - height * 0.5,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.ease);
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
            controller: scrollController,
            child: Container(
              height: height * 1.25,
              child: Column(
                children: [
                  //3/3 text
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, heightFactor * 100, 0, 0),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Step 3/3",
                              style: TextStyle(
                                  fontSize: 35 * heightFactor, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                  color: C.primaryHighlightedColor,
                                  fontSize: heightFactor * 30,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Please enter your new password",
                                style: TextStyle(
                                  fontSize: heightFactor * 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // password and confirm password fields
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              PasswordField(passwordController),
                              SizedBox(height: 20 * heightFactor),
                              ConfirmPasswordField(confirmPasswordController),
                            ],
                          ),
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
                              onPressed: () => onConfirm(),
                              child: Container(
                                height: 60,
                                width: 100,
                                alignment: Alignment.center,
                                child: Text(
                                  "Reset",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
