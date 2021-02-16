import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/models/speaker.dart';
import 'package:flutter/material.dart';

class SpeakerCard extends StatelessWidget {
  final Speaker speaker;

  const SpeakerCard({Key key, this.speaker}) : super(key: key);

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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          speaker.description,
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
                    S.assetSpeakerCardFrame,
                    fit: BoxFit.cover,
                    height: heightFactor * 250,
                  )),
              Positioned(
                  top: 50,
                  left: 35,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    //ADD NETWORK_IMAGE

                    backgroundImage: NetworkImage(speaker.profilePic),
                    radius: 35,
                  )),
              Positioned(
                  top: 50,
                  left: 150,
                  //ADD SPEAKER_NAME
                  child: Text(
                    speaker.name,
                    style: TextStyle(fontSize: heightFactor * 25, color: Colors.black),
                  )),
              Positioned(
                  top: 80,
                  left: 150,
                  child: Container(
                    width: 150,
                    //ADD SPEAKER_DETAILS
                    child: Text(
                      speaker.company,
                      style: TextStyle(fontSize: heightFactor * 20, color: Colors.black),
                      // softWrap: true,
                    ),
                  )),
              Positioned(
                  top: 40,
                  left: 300,
                  bottom: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightFactor * 45,
                        ),
                        GestureDetector(
                            onTap: () {
                              //TODO:
                            },
                            child: Image.asset(
                              S.assetIconLinkdin,
                              height: heightFactor * 20,
                              color: Color.alphaBlend(
                                  C.blendSocialIconColorOne, C.blendSocialIconColorTwo),
                            )),
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
