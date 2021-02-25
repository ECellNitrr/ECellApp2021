import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/models/user.dart';
import 'package:ecellapp/screens/home/cubit/profile_cubit.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () => _profile(context),
        child: Scaffold(
          body: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileError) {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  ScreenBackground(elementId: 0),
                  if (state is ProfileSuccess)
                    _buildSuccess(context, state)
                  else if (state is ProfileLoading)
                    _buildLoading(context)
                  else
                    _buildAskReload()
                ],
              );
            },
          ),
        ));
  }

  Widget _buildAskReload() {
    //Ask to reload screen
    //TODO: Implement a Screen to reload
    return Container();
  }

  Widget _buildLoading(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(child: ECellLogoAnimation(size: width / 2));
  }

  Widget _buildSuccess(BuildContext context, ProfileSuccess state) {
    User user = state.user;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).viewPadding.top;
    double heightFactor = height / 1000;
    return DefaultTextStyle(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          ScreenBackground(elementId: 0),
          Container(
            padding: EdgeInsets.only(top: 56 + top + 20 * heightFactor),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Image.asset(
                    S.assetEcellLogoWhite,
                    width: width * 0.3 * heightFactor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: Form(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: D.horizontalPadding, right: D.horizontalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _label("First Name", heightFactor),
                          _labelValue(width, height, user.firstName),
                          Expanded(flex: 1, child: Container()),
                          _label("Last Name", heightFactor),
                          _labelValue(width, height, user.lastName),
                          Expanded(flex: 1, child: Container()),
                          _label("Email Address", heightFactor),
                          _labelValue(width, height, user.email),
                          Expanded(flex: 1, child: Container()),
                          _label("Phone Number", heightFactor),
                          _labelValue(width, height, user.phoneNumber),
                          Expanded(flex: 1, child: Container()),
                          Container(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {}, //TODO change password
                              child: Text(
                                "Change Password?",
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
                ),
                Expanded(
                  flex: 5,
                  child: Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _profile(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    cubit.getProfile();
  }

  Widget _label(String label, double fontSize) {
    return Text(
      label,
      style: TextStyle(
        color: C.primaryUnHighlightedColor,
        fontSize: 15 * fontSize,
        fontWeight: FontWeight.w100,
        letterSpacing: 1.3,
      ),
    );
  }

  Widget _labelValue(double width, double height, String value) {
    return Container(
      width: width,
      padding: EdgeInsets.only(top: height / 100, bottom: 5),
      child: Text(
        value,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.2),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: C.primaryUnHighlightedColor),
        ),
      ),
    );
  }
}
