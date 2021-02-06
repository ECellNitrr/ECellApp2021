import 'package:ecellapp/screens/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:ecellapp/screens/forgot_password/widgets/otp_field.dart';
import 'package:ecellapp/widgets/email_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is ForgotPasswordCorrectOTP) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Correct OTP")),
            );
          } else if (state is ForgotPasswordWrongOTP) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Wrong OTP")),
            );
          }
        },
        builder: (context, state) {
          if (state is ForgotPasswordInitial) {
            return _initialForgotPasswrod(context);
          } else if (state is ForgotPasswordLoading) {
            return _buildLoading();
          } else if (state is ForgotPasswordEnterOTP) {
            return _enterOTP(context);
          } else if (state is ForgotPasswordWrongOTP) {
            return _enterOTP(context);
          } else if (state is ForgotPasswordCorrectOTP) {
            return _correctOTP();

            /// TODO redirect to next screen
          } else {
            return _initialForgotPasswrod(context);
          }
        },
      ),
    );
  }

  Widget _initialForgotPasswrod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Text("Enter email"),
          EmailField(emailController),
          FlatButton(
              onPressed: () {
                _generatOTP(context);
              },
              child: Text("Press me")),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _enterOTP(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Text("Enter otp"),
          OTPField(otpController),
          FlatButton(
              onPressed: () {
                _verifyOtp(context);
              },
              child: Text("Press me")),
        ],
      ),
    );
  }

  Widget _correctOTP() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Text("correct OTP"),
    );
  }

  void _generatOTP(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.generateOTPInCubit(emailController.text);
  }

  void _verifyOtp(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.verifyOTP(otpController.text);
  }
}
