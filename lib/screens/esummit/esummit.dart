import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/res/colors.dart';
import '../../widgets/screen_background.dart';

class ESummit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildScreen(context),
    );
  }
}

Widget _buildScreen(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double bottom = MediaQuery.of(context).viewInsets.bottom;
  double heightFactor = height / 1000;
  return DefaultTextStyle(
    style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
    child: Stack(
      children: [
        _screenBackground(context),
        AppBar(
            leading: GestureDetector(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          onTap: () {
            //TODO
          },
        )),
      ],
    ),
  );
}

Widget _screenBackground(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [C.backgroundTop, C.backgroundBottom],
      ),
    ),
  );
}
