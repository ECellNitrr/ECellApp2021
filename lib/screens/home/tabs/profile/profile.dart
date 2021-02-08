import 'dart:ffi';

import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/user.dart';
import 'package:ecellapp/screens/home/cubit/profile_cubit.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileSuccess) {
            user = state.user;
            return _buildSuccess(context);
          } else if (state is ProfileLoading) {
            _profile();
            return _buildLoading();
          } else {
            Log.e(tag: "ProfileState", message: "State now is ProfileError reached");
            return Container(); // TODO the user should be shown the error on screen instead of a snackbar, and a retry button.
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightFactor = height / 1000;
    return DefaultTextStyle(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          ScreenBackground(elementId: 0),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: height * 1.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height / 6,
                  ),
                  Flexible(
                    flex: 4,
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            S.assetEcellLogoWhite,
                            width: width * 0.35 * heightFactor,
                          ),
                        ),
                        SizedBox(height: height / 20),
                        Form(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: D.horizontalPadding, right: D.horizontalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _label("First Name", heightFactor),
                                _labelValue(width, height, user.firstName),
                                SizedBox(height: height / 30),
                                _label("Last Name", heightFactor),
                                _labelValue(width, height, user.lastName),
                                SizedBox(height: height / 30),
                                _label("Email Address", heightFactor),
                                _labelValue(width, height, user.email),
                                SizedBox(height: height / 30),
                                _label("Phone Number", heightFactor),
                                _labelValue(width, height, user.phoneNumber),
                                SizedBox(height: height / 15),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {}, //TODO
                                    child: Text(
                                      "Change Number?",
                                      style: TextStyle(
                                        color: C.primaryHighlightedColor,
                                        fontSize: 20 * heightFactor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _profile() {
    final cubit = context.read<ProfileCubit>();
    cubit.profile("token");
  }

  Widget _label(String label, double fontSize) {
    return Text(label,
        style: TextStyle(
            color: C.primaryUnHighlightedColor,
            fontSize: 15 * fontSize,
            fontWeight: FontWeight.w100,
            letterSpacing: 1.3));
  }

  Widget _labelValue(double width, double height, String value) {
    return Container(
      width: width,
      padding: EdgeInsets.only(top: height / 100, bottom: 5),
      child: Text(value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: C.primaryUnHighlightedColor))),
    );
  }
}
