import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            await Future.delayed(Duration(seconds: 1));
            // ignore: todo
            //TODO: Navigator->Home()
          } else if (state is LoginError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
            return _buildInitial(context);
          } else if (state is LoginLoading) {
            return _buildLoading();
          } else if (state is LoginSuccess) {
            return _buildSuccess();
          } else {
            return _buildInitial(context);
          }
        },
      ),
    );
  }

  Widget _buildInitial(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightFactor = height / 1000;

    return DefaultTextStyle(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          //Handles background elements
          ScreenBackground(
            elementId: 1,
          ),
          Container(
            //TODO: Check for need to wrap it in SingleChildScrollView()
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Space for clouds
                Expanded(
                  child: Container(),
                  flex: 2,
                ),
                //Contains all fields
                Flexible(
                  child: Container(),
                  flex: 7,
                ),
                //TODO: Forgot password Text to redirect
                //LoginButton
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: D.horizontalPadding),
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
                          )
                        ],
                      ),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        color: C.authButtonColor,
                        onPressed: () => _login(context),
                        child: Container(
                          height: 60,
                          width: 120,
                          alignment: Alignment.center,
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: C.primaryUnHighlightedColor,
                              fontSize: 20 * heightFactor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //New here Text
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: width / 8, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "New here?",
                          style: TextStyle(fontSize: 18 * heightFactor, color: C.secondaryColor),
                        ),
                        GestureDetector(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20 * heightFactor,
                              color: C.primaryHighlightedColor,
                            ),
                          ),
                          onTap: () {
                            // TODO
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                //To flex background
                Expanded(flex: 3, child: Container()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.check_circle_outline),
          Text(
            "User Login Successful!",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (_formKey.currentState.validate())
      cubit.login(emailController.text, passwordController.text);
  }
}
