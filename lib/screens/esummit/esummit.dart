import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/res/colors.dart';

class ESummit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildScreen(context),
    );
  }
}

Widget _buildScreen(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double heightFactor = height / 1000;
  return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              //TODO
            },
          )),
      body: DefaultTextStyle(
          style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [C.backgroundTop1, C.backgroundBottom1],
                ),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(height: height / 6),
                Expanded(
                    flex: 3,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: D.horizontalPadding + 1),
                        child: Image.asset(
                          S.assetEsummitLogoWhite,
                          width: width * 0.25 * heightFactor,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: D.horizontalPadding, top: 18),
                        child: RichText(
                          text: TextSpan(
                            text: "E-Summit '21",
                            style:
                                TextStyle(fontSize: 45 * heightFactor, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: D.horizontalPadding, top: 30),
                        child: RichText(
                            text: TextSpan(
                          text: "The Genesis of Innovation",
                          style:
                              TextStyle(fontSize: 30 * heightFactor, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: D.horizontalPadding, top: 30, right: D.horizontalPadding),
                        child: RichText(
                          text: TextSpan(
                            text: "At ",
                            style: TextStyle(
                                fontSize: 20 * heightFactor,
                                fontWeight: FontWeight.w300,
                                wordSpacing: 4),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "E-Summit ",
                                  style: TextStyle(
                                      color: C.speakerButtonColor, fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: S.esummitPara,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: D.horizontalPadding, top: 40),
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
                                  color: C.speakerButtonColor,
                                  onPressed: () {
                                    //TODO
                                  },
                                  child: Container(
                                      height: 50,
                                      width: 120,
                                      alignment: Alignment.center,
                                      child: Row(children: [
                                        SizedBox(
                                          width: heightFactor * 20,
                                        ),
                                        Text(
                                          "Speakers",
                                          style: TextStyle(
                                              color: C.primaryUnHighlightedColor,
                                              fontSize: 20 * heightFactor,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          width: heightFactor * 10,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: C.primaryUnHighlightedColor,
                                          size: heightFactor * 20,
                                        )
                                      ])))))
                    ]))
              ]))));
}
