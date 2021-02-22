import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightFactor = MediaQuery.of(context).size.height / 1000;
    double ratio = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: DefaultTextStyle.merge(
        style: GoogleFonts.roboto().copyWith(
            color: C.primaryUnHighlightedColor, fontSize: 20, fontWeight: FontWeight.w900),
        child: Stack(
          children: [
            ScreenBackground(elementId: 0),
            Column(
              children: [
                SizedBox(
                  height: ratio > 0.5 ? 100 : 120,
                ),
                Expanded(
                    flex: 2,
                    child: Image.asset(
                      S.asset404Image,
                      width: ratio > 0.5 ? 225 : 245,
                    )),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        children: [
                          Text("Oops!"),
                          Text("Looks Like This Page Was"),
                          Text("Lost In Space"),
                          SizedBox(
                            height: ratio > 0.5 ? 40 : 60,
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
                              onPressed: () => {
                                //TODO:
                              },
                              child: Container(
                                height: ratio > 0.5 ? 40 : 60,
                                width: ratio > 0.5 ? 80 : 100,
                                alignment: Alignment.center,
                                child: Text(
                                  "Retry",
                                  style: TextStyle(
                                      color: C.primaryUnHighlightedColor,
                                      fontSize: 20 * heightFactor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
