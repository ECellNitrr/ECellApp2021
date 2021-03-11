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

  String otpEntered = "";

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
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              ScreenBackground(elementId: 0),
              if (state is ForgotEmailInitial)
                AskEmailScreen(
                  emailController: emailController,
                  onSubmit: _sendOTP(context, state),
                )
              else if (state is ForgotLoading)
                _buildLoading(context)
              else if (state is ForgotOTPInitial)
                EnterOTPScreen(
                  numSelected: _onNumSelected,
                  otp: otpEntered,
                  toVerify: _verifyOtp(context, state),
                )
              else if (state is ForgotPasswordError)
                _uiUpdateForNetworkError(context, state.state)
              else if (state is ForgotResetInitial)
                ResetPassword(
                    onConfirm: _changePassword(context, state),
                    confirmPasswordController: confirmPasswordController,
                    passwordController: passwordController)
              else if (state is ForgotResetSuccess)
                _passwordResetSuccess()
              else
                AskEmailScreen(
                  emailController: emailController,
                  onSubmit: _sendOTP(context, state),
                )
            ],
          );
        },
      ),
    );
  }

  Widget _uiUpdateForNetworkError(BuildContext context, ForgotPasswordState state) {
    if (state is ForgotEmailInitial) {
      return AskEmailScreen(
        emailController: emailController,
        onSubmit: _sendOTP(context, state),
      );
    } else if (state is ForgotOTPInitial) {
      return EnterOTPScreen(
        numSelected: _onNumSelected,
        otp: otpEntered,
        toVerify: _verifyOtp(context, state),
      );
    } else if (state is ForgotPasswordError) {
      return EnterOTPScreen(
        numSelected: _onNumSelected,
        otp: otpEntered,
        toVerify: _verifyOtp(context, state),
      );
    } else if (state is ForgotResetInitial) {
      return ResetPassword(
          onConfirm: _changePassword(context, state),
          confirmPasswordController: confirmPasswordController,
          passwordController: passwordController);
    } else {
      return AskEmailScreen(
        emailController: emailController,
        onSubmit: _sendOTP(context, state),
      );
    }
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

  _sendOTP(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.sendOTP(emailController.text, state);
  }

  _verifyOtp(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.checkOTP(otpEntered.substring(0, 4), state, emailController.text);
  }

  _changePassword(BuildContext context, ForgotPasswordState state) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.changePassword(emailController.text, otpEntered.substring(0, 4), passwordController.text,
        confirmPasswordController.text, state);
  }

  _onNumSelected(int p1) {
    setState(() {
      otpEntered = otpEntered.substring(0, 4);
      if (p1 == -1) {
        if (otpEntered.length > 0) {
          otpEntered = otpEntered.substring(0, otpEntered.length - 1);
        }
      } else {
        otpEntered = otpEntered + p1.toString();
      }
    });
  }
}
