import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/res/colors.dart';
import '../../widgets/screen_background.dart';

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
  double bottom = MediaQuery.of(context).viewInsets.bottom;
  double heightFactor = height / 1000;
  return DefaultTextStyle(
    style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
    child: Stack(
      children: [
        _screenBackground(context),
        AppBar(
            leading: GestureDetector(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          onTap: () {
            //TODO
          },
        )),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height / 8),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
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
                      child: Text(
                        "E-Summit '21",
                        style: TextStyle(fontSize: 45 * heightFactor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: D.horizontalPadding, top: 30),
                      child: Text(
                        "The Genesis of Innovation",
                        style: TextStyle(fontSize: 30 * heightFactor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: D.horizontalPadding, top: 30, right: D.horizontalPadding),
                      child: Text(
                        S.esummitPara,
                        style: TextStyle(
                            fontSize: 20 * heightFactor,
                            fontWeight: FontWeight.w100,
                            wordSpacing: 4),
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
                          color: C.authButtonColor,
                          onPressed: () {}, //TODO
                          child: Container(
                            height: 50,
                            width: 120,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Speakers",
                                  style: TextStyle(
                                      color: C.primaryUnHighlightedColor,
                                      fontSize: 20 * heightFactor,
                                      fontWeight: FontWeight.w100),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 10,
                                )
                              ],
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
      ],
    ),
  );
}

Widget _screenBackground(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [C.backgroundTop1, C.backgroundBottom1],
      ),
    ),
  );
}
