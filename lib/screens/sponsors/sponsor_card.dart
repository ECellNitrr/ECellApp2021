import 'package:ecellapp/models/sponsor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';

class SponsorCard extends StatelessWidget {
  final Sponsor sponsor;

  const SponsorCard({Key key, this.sponsor}) : super(key: key);

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
              Positioned(
                  top: 15,
                  right: 0,
                  bottom: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 45),
                        GestureDetector(
                            onTap: () async {
                              //Handle sponsor.spons[0].socialMedia
                              if (await canLaunch(sponsor.website)) {
                                await launch(sponsor.website);
                              } else {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(content: Text(S.redirectIntentError)));
                              }
                            },
                            child: Image.asset(
                              S.assetSponsorGlobeIcon,
                              height: 20,
                              color: Color.alphaBlend(
                                  C.blendSocialIconColorOne, C.blendSocialIconColorTwo),
                            )),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        Positioned(
          height: ratio > 0.5 ? 200 : 220,
          width: ratio > 0.5 ? 150 : 170,
          child: Stack(
            children: [
              Image.asset(
                S.assetSponsorFrame,
                fit: BoxFit.cover,
                height: 220,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(sponsor.picUrl),
                  radius: 45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
