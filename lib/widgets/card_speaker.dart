import 'package:flutter/material.dart';

class ClipperConic extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(32.93299999999999 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      32.93299999999999 * _xScaling,
      0 * _yScaling,
      97.93300000000002 * _xScaling,
      0 * _yScaling,
      97.93300000000002 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      112.17600000000002 * _xScaling,
      0 * _yScaling,
      121.49100000000001 * _xScaling,
      10.12700000000001 * _yScaling,
      121.77900000000002 * _xScaling,
      24.36699999999999 * _yScaling,
    );
    path.cubicTo(
      121.95100000000005 * _xScaling,
      32.888000000000005 * _yScaling,
      119.03100000000003 * _xScaling,
      45.68199999999999 * _yScaling,
      113.94900000000004 * _xScaling,
      57.077 * _yScaling,
    );
    path.cubicTo(
      99.46000000000006 * _xScaling,
      89.56700000000001 * _yScaling,
      112.48400000000007 * _xScaling,
      129.02900000000002 * _yScaling,
      112.48400000000007 * _xScaling,
      129.02900000000002 * _yScaling,
    );
    path.cubicTo(
      112.48400000000007 * _xScaling,
      129.02900000000002 * _yScaling,
      112.22700000000006 * _xScaling,
      147.08400000000003 * _yScaling,
      100.07000000000008 * _xScaling,
      147.08400000000003 * _yScaling,
    );
    path.cubicTo(
      100.07000000000008 * _xScaling,
      147.08400000000003 * _yScaling,
      32.93299999999999 * _xScaling,
      147.08400000000003 * _yScaling,
      32.93299999999999 * _xScaling,
      147.08400000000003 * _yScaling,
    );
    path.cubicTo(
      18.68639485149953 * _xScaling,
      147.08068938806335 * _yScaling,
      7.138999615341646 * _xScaling,
      135.53060553315882 * _yScaling,
      7.138999999999982 * _xScaling,
      121.28400000000002 * _yScaling,
    );
    path.cubicTo(
      7.138999999999982 * _xScaling,
      121.28400000000002 * _yScaling,
      7.138999999999982 * _xScaling,
      25.793999999999983 * _yScaling,
      7.138999999999982 * _xScaling,
      25.793999999999983 * _yScaling,
    );
    path.cubicTo(
      7.138999999999982 * _xScaling,
      11.548367162864508 * _yScaling,
      18.68736716286452 * _xScaling,
      0 * _yScaling,
      32.93299999999999 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      32.93299999999999 * _xScaling,
      0 * _yScaling,
      32.93299999999999 * _xScaling,
      0 * _yScaling,
      32.93299999999999 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
