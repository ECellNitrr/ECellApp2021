import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/screens/forgot_password/ask_email.dart';
import 'package:ecellapp/screens/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:ecellapp/screens/forgot_password/enter_otp.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'reset_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String otpEntered = " " * 4, finalOTP = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ScreenBackground(elementId: 0),
          BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is ForgotLoading)
                return _buildLoading(context);
              else if (state is ForgotPasswordError)
                return _stepScreen(context, state.state);
              else if (state is ForgotResetSuccess)
                return _passwordResetSuccess();
              else
                return _stepScreen(context, state);
            },
          ),
        ],
      ),
    );
  }

  Widget _stepScreen(BuildContext context, ForgotPasswordState state) {
    if (state is ForgotEmailInitial)
      return AskEmailScreen(
        emailController: emailController,
        onSubmit: () => _sendOTP(context, state),
      );
    else if (state is ForgotOTPInitial)
      return EnterOTPScreen(
        numSelected: _onNumSelected,
        otp: otpEntered,
        toVerify: () => _verifyOtp(context, state),
      );
    else if (state is ForgotResetInitial)
      return ResetPassword(
        onConfirm: () => _changePassword(context, state),
        confirmPasswordController: confirmPasswordController,
        passwordController: passwordController,
      );
    else
      return AskEmailScreen(
        emailController: emailController,
        onSubmit: () => _sendOTP(context, state),
      );
  }

  Widget _buildLoading(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(child: ECellLogoAnimation(size: width / 2));
  }

  Widget _passwordResetSuccess() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            S.assetEcellLogoWhite,
            height: 170,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Row(
              children: [
                Text(
                  "Sucess",
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w600, color: C.primaryHighlightedColor),
                ),
                Icon(
                  Icons.check_circle,
                  color: C.primaryUnHighlightedColor,
                  size: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _sendOTP(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (emailValid) {
      cubit.sendOTP(emailController.text, state);
    }
  }

  void _verifyOtp(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();

    cubit.checkOTP(otpEntered.substring(0, 4), state, emailController.text);
  }

  void _changePassword(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();

    cubit.changePassword(emailController.text, otpEntered.substring(0, 4), passwordController.text,
        confirmPasswordController.text, state);
  }

  _onNumSelected(int numEntered) {
    int length = otpEntered.length;
    setState(() {
      if (numEntered == -1) {
        if (length > 0) {
          finalOTP = finalOTP.substring(0, finalOTP.length - 1);
          otpEntered = finalOTP + " " * (4 - finalOTP.length);
        }
      } else if (length < 5) {
        if (finalOTP.length < 4) {
          finalOTP += numEntered.toString();
        }
        otpEntered = finalOTP + " " * (4 - finalOTP.length);
      }
    });
  }
}
