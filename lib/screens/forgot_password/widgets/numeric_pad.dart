import 'package:ecellapp/core/res/colors.dart';
import 'package:flutter/material.dart';

class NumericPad extends StatelessWidget {
  final Function(int) onNumberSelected;

  NumericPad({@required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildNumber(1),
                  buildNumber(2),
                  buildNumber(3),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildNumber(4),
                  buildNumber(5),
                  buildNumber(6),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildNumber(7),
                  buildNumber(8),
                  buildNumber(9),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildEmptySpace(),
                  buildNumber(0),
                  buildBackspace(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumber(int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(number);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.75),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.35),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: C.primaryUnHighlightedColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.75),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.backspace_outlined,
                size: 20,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmptySpace() {
    return Expanded(
      child: Container(),
    );
  }
}
