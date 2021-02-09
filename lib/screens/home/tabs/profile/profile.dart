import 'package:ecellapp/models/user.dart';
import 'package:ecellapp/screens/home/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
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

  Widget _buildSuccess(context) {
    //TODO On success UI
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.check_circle_outline),
          Text(
            user.email,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _profile() {
    final cubit = context.read<ProfileCubit>();
    cubit.getProfile();
  }
}
