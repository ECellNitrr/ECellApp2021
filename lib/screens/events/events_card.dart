import 'package:flutter/material.dart';

import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.aspectRatio;
    double heigh = MediaQuery.of(context).size.height;
    double heighFactor = heigh / 1000;
    var eventDateTime = event.date.split("T");
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.fromLTRB(D.horizontalPaddingFrame2, 0, D.horizontalPaddingFrame2, 0),
          child: Stack(
            children: [
              Padding(
                //To decrease the top of card
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ExpansionTile(
                    title: Container(
                      //To decrease bottom of card
                      height: ratio > 0.5 ? 140 : 180,
                      margin: EdgeInsets.only(left: 130),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                event.name,
                                style: TextStyle(
                                  fontSize: heighFactor * 30,
                                  color: C.cardFontColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Date:\t\t${eventDateTime[0]}",
                                style: TextStyle(
                                  fontSize: heighFactor * 25,
                                  color: C.cardFontColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Time:\t\t${eventDateTime[1].split("+")[0].substring(0, 5)}",
                                style:
                                    TextStyle(fontSize: heighFactor * 25, color: C.cardFontColor),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Venue:\t\t${event.venue}",
                                style:
                                    TextStyle(fontSize: heighFactor * 25, color: C.cardFontColor),
                              ),
                            ]),
                      ),
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
                top: 100,
                right: ratio > 0.5 ? -30 : -40,
                child: Padding(
                    padding: EdgeInsets.all(40),
                    //Gradient Button
                    child: Container(
                      width: 90,
                      height: 25.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            C.eventsButtonGradientLeft,
                            C.eventsButtonGradientMid,
                            C.eventsButtonGradientRight,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0.0, 5),
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () => {
                                  //TODO: Add Register to event Intent
                                },
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: C.primaryUnHighlightedColor,
                                  fontSize: ratio > 0.5 ? 12 : 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            )),
                      ),
                    )),
              ),
              Positioned(
                  top: 0,
                  left: ratio > 0.5 ? -15 : -20,
                  height: ratio > 0.5 ? 210 : 235,
                  width: ratio > 0.5 ? 150 : 160,
                  child: Stack(
                    children: [
                      Image.asset(
                        S.assetEventFrame,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                offset: Offset(0.0, 5),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.teal,
                            backgroundImage: NetworkImage(event.iconUrl),
                            radius: 40,
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
