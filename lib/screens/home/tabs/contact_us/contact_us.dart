import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:ecellapp/screens/home/cubit/feedback_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<FeedbackCubit, FeedbackState>(listener: (context, state) {
          if (state is FeedbackError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is FeedbackSuccess) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("Feedback Posted Successful")));
          }
        }, builder: (context, state) {
          if (state is FeedbackLoading) {
            return _buildLoading();
          } else {
            return _buildInitial(context);
          }
        }));
  }

  Widget _buildInitial(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).viewPadding.top;
    double heightFactor = height / 1000;
    return DefaultTextStyle.merge(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          ScreenBackground(elementId: 0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20 * heightFactor, left: D.horizontalPadding),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 56 + top + 20 * heightFactor),
                  child: RichText(
                    text: TextSpan(
                      text: "Contact Us",
                      style: TextStyle(fontSize: 45 * heightFactor, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20 * heightFactor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: C.primaryHighlightedColor,
                        size: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          text: S.ecellAddress,
                          style: TextStyle(
                              fontSize: 20 * heightFactor,
                              fontWeight: FontWeight.w300,
                              height: 1.2,
                              wordSpacing: 4),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20 * heightFactor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: C.primaryHighlightedColor,
                        size: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          text: S.ecellPhone,
                          style: TextStyle(
                              fontSize: 20 * heightFactor,
                              fontWeight: FontWeight.w300,
                              height: 1.2,
                              wordSpacing: 4),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20 * heightFactor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: C.primaryHighlightedColor,
                        size: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          text: S.ecellEmail,
                          style: TextStyle(
                              fontSize: 20 * heightFactor,
                              fontWeight: FontWeight.w300,
                              height: 1.2,
                              wordSpacing: 4),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20 * heightFactor),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.person,
                          color: C.primaryHighlightedColor,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.person,
                          color: C.primaryHighlightedColor,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.person,
                          color: C.primaryHighlightedColor,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.person,
                          color: C.primaryHighlightedColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20 * heightFactor),
                  child: RichText(
                    text: TextSpan(
                      text: "Feedback",
                      style: TextStyle(fontSize: 45 * heightFactor, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20 * heightFactor),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: S.feedbackLine,
                          style: TextStyle(
                              fontSize: 20 * heightFactor,
                              fontWeight: FontWeight.w300,
                              height: 1.2,
                              wordSpacing: 4),
                        ),
                      ),
                      Icon(
                        Icons.person,
                        color: C.primaryHighlightedColor,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20 * heightFactor),
                  width: width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: C.primaryHighlightedColor,
                        size: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: feedbackController,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: D.horizontalPadding, top: 40),
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: C.authButtonColor.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(0, 12),
                        ),
                      ],
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      color: C.authButtonColor,
                      onPressed: () => _postFeedback(context),
                      child: Container(
                        height: 50,
                        width: 120,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Speakers",
                              style: TextStyle(
                                color: C.primaryUnHighlightedColor,
                                fontSize: 20 * heightFactor,
                                fontWeight: FontWeight.w300,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  void _postFeedback(BuildContext context) {
    final cubit = context.read<FeedbackCubit>();
    if (_formKey.currentState.validate()) cubit.postFeedback(feedbackController.text);
  }
}
