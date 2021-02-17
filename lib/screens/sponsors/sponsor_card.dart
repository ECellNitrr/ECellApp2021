import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/models/sponsor.dart';

class SponsorCard extends StatelessWidget {
  final Sponsor sponsor;

  const SponsorCard({Key key, this.sponsor}) : super(key: key);

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
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    S.assetSponsorFrame,
                    fit: BoxFit.cover,
                    height: heightFactor * 250,
                  )),
              Positioned(
                  top: heightFactor * 70,
                  left: heightFactor * 55,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    //ADD NETWORK_IMAGE

                    backgroundImage: NetworkImage(sponsor.picUrl),
                    radius: heightFactor * 45,
                  )),
              Positioned(
                  top: heightFactor * 60,
                  left: heightFactor * 200,
                  //ADD sponsor_NAME
                  child: Text(
                    sponsor.name,
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
                    //ADD sponsor_DETAILS
                    child: Text(
                      sponsor.sponsType,
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
                        GestureDetector(
                            onTap: () async {
                              //Handle sponsor.socialMedia
                              if (await canLaunch(sponsor.website)) {
                                await launch(sponsor.website);
                              } else {
                                throw UnknownException();
                              }
                            },
                            child: Icon(
                              Icons.web,
                              size: heightFactor * 20,
                              color: Color.alphaBlend(Colors.black12, Colors.black38),
                            ))
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
