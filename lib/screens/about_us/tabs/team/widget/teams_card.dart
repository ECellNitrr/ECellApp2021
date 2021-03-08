import 'package:ecellapp/models/sponsor.dart';
import 'package:flutter/material.dart';

import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';

class TeamsCard extends StatelessWidget {
  final Sponsor sponsor;

  const TeamsCard({Key key, this.sponsor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.aspectRatio;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: D.horizontalPaddingFrame),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Container(
                    height: ratio > 0.5 ? 140 : 160,
                    margin: EdgeInsets.only(left: 130),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: Text(
                        sponsor.name,
                        style: TextStyle(
                          fontSize: 20,
                          color: C.cardFontColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          height: ratio > 0.5 ? 200 : 220,
          width: ratio > 0.5 ? 150 : 170,
          child: Stack(
            children: [
              Image.asset(
                S.assetTeamsFrame,
                fit: BoxFit.cover,
                height: 220,
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(0.0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(sponsor.picUrl),
                    radius: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}