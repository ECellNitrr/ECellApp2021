import 'package:flutter/cupertino.dart';
import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AimScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTextStyle.merge(
              style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
              child: screenBody(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget screenBody(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double heightFactor = height / 1000;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(D.horizontalPadding, 30, D.horizontalPadding, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aboutUsText(width, height, bottom, heightFactor),
              aimTextSection(width, height, bottom, heightFactor),
              visionTextSection(width, height, bottom, heightFactor),
            ],
          ),
        ),
      ],
    );
  }

  Widget aboutUsText(double width, double height, double bottom, double heightFactor) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: width / 50),
      child: Text(
        "About Us",
        style: TextStyle(
          fontSize: 50 * heightFactor,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget aimTextSection(double width, double height, double bottom, double heightFactor) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: width / 50, top: heightFactor * 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aim",
            style: TextStyle(
              fontSize: 40 * heightFactor,
              fontWeight: FontWeight.w900,
              color: C.primaryHighlightedColor,
            ),
          ),
          SizedBox(
            height: heightFactor * 10,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "At ",
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: 0.5,
                    wordSpacing: 1.5,
                    fontSize: 20 * heightFactor,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "E-Summit ",
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: 0.5,
                    wordSpacing: 1.5,
                    fontSize: 20 * heightFactor,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: S.aimPara,
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: 0.5,
                    wordSpacing: 1.5,
                    fontSize: 20 * heightFactor,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget visionTextSection(double width, double height, double bottom, double heightFactor) {
    return Container(
      alignment: Alignment.centerLeft,
      padding:
          EdgeInsets.only(left: width / 50, top: heightFactor * 35, bottom: heightFactor * 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vision",
            style: TextStyle(
              fontSize: 40 * heightFactor,
              fontWeight: FontWeight.w900,
              color: C.primaryHighlightedColor,
            ),
          ),
          SizedBox(
            height: heightFactor * 10,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "At ",
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: 0.5,
                    wordSpacing: 1.5,
                    fontSize: 20 * heightFactor,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "E-Summit ",
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: 0.5,
                    wordSpacing: 1.5,
                    fontSize: 20 * heightFactor,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: S.visionPara,
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: 0.5,
                    wordSpacing: 1.5,
                    fontSize: 20 * heightFactor,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
