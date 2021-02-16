import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double heightFactor = height / 1000;
    return Container(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(D.horizontalPadding),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 0, 50),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  // color: Colors.white,
                  child: ExpansionTile(
                    title: Container(
                      height: heightFactor * 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          event.details,
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    S.assetEventFrame,
                    fit: BoxFit.cover,
                    height: heightFactor * 250,
                  )),
              Positioned(
                  top: heightFactor * 70,
                  left: heightFactor * 55,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    //ADD NETWORK_IMAGE

                    backgroundImage: NetworkImage(event.iconUrl),
                    radius: heightFactor * 45,
                  )),
              Positioned(
                  top: heightFactor * 60,
                  left: heightFactor * 200,
                  //ADD event_NAME
                  child: Text(
                    event.name,
                    style: TextStyle(
                        fontSize: heightFactor * 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )),
              Positioned(
                  top: heightFactor * 100,
                  left: heightFactor * 200,
                  child: Container(
                    width: 150,
                    //ADD event_DETAILS
                    //TODO:REPLACE ALL BY Column date time venue
                    child: Text(
                      event.date,
                      style: TextStyle(fontSize: heightFactor * 20, color: Colors.black),
                      // softWrap: true,
                    ),
                  )),
              Positioned(
                  top: heightFactor * 40,
                  left: heightFactor * 368,
                  bottom: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightFactor * 45,
                        ),
                        //TODO: ADD A GRADIENT BUTTON HERE
                      ],
                    ),
                  )),
            ],
          ),
        )
      ],
    ));
  }
}
