import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/models/event.dart';
import 'package:ecellapp/screens/events/cubit/events_cubit.dart';
import 'package:ecellapp/widgets/ecell_animation.dart';
import 'package:ecellapp/widgets/reload_on_error.dart';
import 'package:ecellapp/widgets/screen_background.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'events_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key key}) : super(key: key);

  _doReaload(BuildContext context) {
    //TODO:
  }
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllEvents(context),
      child: Scaffold(
        body: BlocConsumer<EventsCubit, EventsState>(
          listener: (context, state) {
            if (state is EventsError) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
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
              body: Stack(
                children: [
                  ScreenBackground(elementId: 0),
                  if (state is EventsInitial)
                    _buildLoading(context)
                  else if (state is EventsSuccess)
                    _buildSuccess(context, state.json)
                  else if (state is EventsLoading)
                    _buildLoading(context)
                  else
                    ReloadOnErrorScreen(doOnPress: () => _doReaload(context)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(child: ECellLogoAnimation(size: width / 2));
  }

  Widget _buildSuccess(BuildContext context, List<Event> eventsList) {
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    final ScrollController _scrollController = ScrollController();
    double ratio = MediaQuery.of(context).size.aspectRatio;
    double top = MediaQuery.of(context).viewPadding.top;

    List<Widget> eventObjList = [];
    eventsList.forEach((element) => eventObjList.add(EventCard(event: element)));

    if (_scrollController.hasClients) {
      if (bottom > height * 0.25) {
        _scrollController.animateTo(
          bottom - height * 0.25,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    }

    return DefaultTextStyle.merge(
      style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
      child: Stack(
        children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              child: Container(
                margin: EdgeInsets.only(top: top + 56),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Events",
                      style: TextStyle(
                        fontSize: ratio > 0.5 ? 45 : 50,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(children: eventObjList),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getAllEvents(BuildContext context) {
    final cubit = context.read<EventsCubit>();
    cubit.getAllEvents();
  }
}
