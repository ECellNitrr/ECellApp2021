import 'package:ecellapp/screens/change_number/cubit/change_number_cubit.dart';
import 'package:ecellapp/screens/change_number/widgets/mobile_number_field.dart';
import 'package:ecellapp/screens/change_number/widgets/otp_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeNumberScreen extends StatelessWidget {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChangeNumberCubit, ChangeNumberState>(
        listener: (context, state) {
          if (state is ChangeNumberError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is ChangeNumberWrongOtp) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is ChangeNumberOtpSuccessful) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Successful")),
            );
          }
        },
        builder: (context, state) {
          if (state is ChangeNumberInitial) {
            return _initial(context);
          } else if (state is ChangeNumberOTP) {
            return _enterOtp(context);
          } else if (state is ChangeNumberOtpSuccessful) {
            ///
            return _success();
          } else {
            return _initial(context);
          }
        },
      ),
    );
  }

  Widget _initial(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          MobileNumberField(mobileController),
          FlatButton(
              onPressed: () {
                final cubit = context.read<ChangeNumberCubit>();
                cubit.getOtp(mobileController.text);
              },
              child: Text("Get otp")),
        ],
      ),
    );
  }

  Widget _enterOtp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          OtpField(otpController),
          FlatButton(
            onPressed: () {
              final cubit = context.read<ChangeNumberCubit>();
              cubit.verifyOtp(otpController.text);
            },
            child: Text("verify"),
          ),
        ],
      ),
    );
  }

  Widget _success() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [Text("Success")],
      ),
    );
  }
}
