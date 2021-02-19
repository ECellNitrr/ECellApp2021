import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/models/event.dart';
import 'package:ecellapp/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.aspectRatio;

    var eventDateTime = event.date.split("T");
    return Container(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(D.horizontalPaddingFrame),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  // color: Colors.white,
                  child: ExpansionTile(
                    title: Container(
                      height: ratio > 0.5 ? 160 : 180,
                      margin: EdgeInsets.only(left: 130),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              event.name,
                              style: TextStyle(
                                fontSize: 20,
                                color: C.cardFontColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Date:\t\t${eventDateTime[0]}",
                              style: TextStyle(fontSize: 17, color: C.cardFontColor),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Time:\t\t${eventDateTime[1].split("+")[0].substring(0, 8)}",
                              style: TextStyle(fontSize: 17, color: C.cardFontColor),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Venue:\t\t${event.venue}",
                              style: TextStyle(fontSize: 17, color: C.cardFontColor),
                            ),
                          ]),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          event.details,
                          style: TextStyle(color: C.cardFontColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 115,
                right: -30,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: GradientButton(
                    width: 90,
                    gradient: LinearGradient(
                      colors: <Color>[
                        C.eventsButtonGradientLeft,
                        C.eventsButtonGradientMid,
                        C.eventsButtonGradientMid,
                        C.eventsButtonGradientRight,
                        C.eventsButtonGradientRight,
                      ],
                    ),
                    onPressed: () => {},
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: C.primaryUnHighlightedColor,
                        fontSize: ratio > 0.5 ? 12 : 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: -10,
                  height: ratio > 0.5 ? 220 : 240,
                  width: ratio > 0.5 ? 150 : 170,
                  child: Stack(
                    children: [
                      Image.asset(
                        S.assetEventFrame,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          backgroundImage: NetworkImage(event.iconUrl),
                          radius: 45,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )
      ],
    ));
  }
}
