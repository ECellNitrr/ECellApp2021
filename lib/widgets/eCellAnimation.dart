import 'package:ecellapp/core/res/strings.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ECellAnimations extends StatefulWidget {
  @override
  _ECellAnimationsState createState() => _ECellAnimationsState();
}

class _ECellAnimationsState extends State<ECellAnimations> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  Animation<double> animation2;
  AnimationController controller2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygons'),
      ),
      body: SafeArea(
        child: Container(
          height: 500,
          width: 500,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: CurvePainter(animation.value),
                child: Center(
                    child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: Image.asset(
                    S.assetEcellLogoWhite,
                    width: 100,
                  ),
                )),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double radians;
  CurvePainter(this.radians);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(size.width / 3, size.height / 2 - 55) & Size(150, 150), 0 + radians,
        math.pi, false, paint);
    var paint1 = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(size.width / 3 + 5, size.height / 2 + 5 - 55) & Size(140, 140), 0,
        2 * math.pi, false, paint1);
    var paint2 = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(size.width / 3 + 10, size.height / 2 + 10 - 55) & Size(130, 130),
        0 + radians, 2 * math.pi, false, paint2);
    var paint3 = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(size.width / 3 + 15, size.height / 2 + 15 - 55) & Size(120, 120), 0,
        2 * math.pi, false, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
