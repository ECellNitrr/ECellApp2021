import 'package:ecellapp/models/sponsors.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/sponsors_cubit.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllSponsorss(context),
      child: Scaffold(
        body: BlocConsumer<SponsorsCubit, SponsorsState>(listener: (context, state) {
          if (state is SponsorsError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        }, builder: (context, state) {
          if (state is SponsorsInitial) {
            return _buildInitial();
          } else if (state is SponsorsSuccess) {
            return _buildSuccess(context, state.sponsorsList);
          } else if (state is SponsorsLoading) {
            return _buildLoading();
          } else {
            return _buildAskReload();
          }
        }),
      ),
    );
  }

  Widget _buildInitial() {
    return Container();
  }

  Widget _buildSuccess(BuildContext context, List<Sponsors> sponsorsList) {
    //TODO: UI
    List<Widget> _sL = [];
    sponsorsList.forEach((element) {
      _sL.add(Text(element.name, textAlign: TextAlign.center));
    });
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _sL,
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildAskReload() {
    //Ask to reload screen
    //TODO: Implement a Screen to reload
    return Container();
  }

  void _getAllSponsorss(BuildContext context) {
    final cubit = context.read<SponsorsCubit>();
    cubit.getSponsorsList();
  }
}
