import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/dimens.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/event.dart';
import 'package:ecellapp/screens/events/cubit/events_cubit.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'eventsCard.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllEvents(context),
      child: Scaffold(
        body: BlocConsumer<EventsCubit, EventsState>(
          listener: (context, state) {
            if (state is EventsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is EventsInitial) {
              return _buildInitial();
            } else if (state is EventsSuccess) {
              return _buildSuccess(context, state.json);
            } else if (state is EventsLoading) {
              return _buildLoading();
            } else {
              Log.e(tag: "EventsState", message: "State now is EventsError reached");
              return Container(); // TODO the user should be shown the error on screen instead of a snackbar, and a retry button.
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Event> eventsList) {
    //TODO On success UI

    double height = MediaQuery.of(context).size.height;
    double heightFactor = height / 1000;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    final ScrollController _scrollController = ScrollController();

    Log.d(tag: "EventsScreen:", message: "SizeEventsList:${eventsList.length}");

    List<Widget> eventObjList = [];
    eventsList.forEach((element) {
      eventObjList.add(EventCard(event: element));
    });

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

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [C.backgroundTop1, C.backgroundBottom1],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
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
        body: DefaultTextStyle.merge(
          style: GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: heightFactor * 100,
                  ),
                  //Heading
                  SizedBox(
                    height: heightFactor * 100,
                    child: Text(
                      "Events",
                      style: TextStyle(
                          fontSize: heightFactor * 50,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.00),
                    ),
                  ),
                  Flexible(
                      child: Column(
                    children: eventObjList,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInitial() {
    return Container();
  }

  void _getAllEvents(BuildContext context) {
    final cubit = context.read<EventsCubit>();
    cubit.getAllEvents();
  }
}
