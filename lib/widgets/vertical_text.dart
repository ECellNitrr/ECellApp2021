import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  final String name;
  final bool checked;

  VerticalText({this.name, this.checked});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          color: checked ? Colors.blue : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                color: checked ? Colors.white : Colors.purple,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
