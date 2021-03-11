import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/screens/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/numeric_pad.dart';

class EnterOTPScreen extends StatelessWidget {
  const EnterOTPScreen({Key key, this.otp, this.toVerify, this.numSelected}) : super(key: key);

  final Function(BuildContext context, ForgotPasswordState state) toVerify;
  final Function(int) numSelected;
  final String otp;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double heightFactor = height / 1000;
    if (scrollController.hasClients) {
      if (bottom > height * 0.25) {
        scrollController.animateTo(
          bottom - height * 0.25,
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
                                    otp[0] ?? "",
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
                                    otp[1] ?? "",
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
                                    otp[2] ?? "",
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
                                    otp[3] ?? "",
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
                                    text: "[Time]s",
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
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                boxShadow: [
                                  BoxShadow(
                                    color: C.backgroundTop,
                                    // blurRadius: 10,
                                    //spreadRadius: 3,
                                    //offset: Offset(0, 12),
                                  )
                                ],
                              ),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                color: Colors.transparent,
                                onPressed: () => toVerify,
                                child: Container(
                                  height: 50,
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
                                onPressed: () => toVerify,
                                child: Container(
                                  height: 54,
                                  width: 124,
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
                    flex: 4,
                    child: NumericPad(onNumberSelected: numSelected),
                  ),
                  SizedBox(height: heightFactor * 40)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
