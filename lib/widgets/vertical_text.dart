import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  String name;
  bool checked;

  VerticalText({this.name, this.checked});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(
          name,
          maxLines: 1,
          style: TextStyle(
            color: checked ? Colors.purple : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
