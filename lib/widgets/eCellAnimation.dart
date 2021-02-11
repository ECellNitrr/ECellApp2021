import 'dart:ui';

import 'package:ecellapp/core/res/colors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/widgets/screen_background.dart';
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
      body: Center(
        child: Container(
          child: Stack(
            children: [
              ScreenBackground(
                elementId: 0,
              ),
              Center(
                  child: AnimatedBuilder(
                animation: animation,
                builder: (context, snapshot) {
                  return CustomPaint(
                    painter: SolidRingsPainter(animation.value),
                  );
                },
              )),
              Center(
                  child: AnimatedBuilder(
                animation: animation,
                builder: (context, snapshot) {
                  return CustomPaint(
                    painter: BlurredRingsPainter(animation.value),
                  );
                },
              )),
              Center(
                child: Image.asset(
                  S.assetEcellLogoWhite,
                  width: 120,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SolidRingsPainter extends CustomPainter {
  final double radians;
  SolidRingsPainter(this.radians);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = C.ring4
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Offset(size.width / 2, size.height / 2) & Size(180, 180), 0, 2 * math.pi, false, paint);
    var paint1 = Paint()
      ..color = C.ring3
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(size.width / 2 + 10, size.height / 2 + 10) & Size(160, 160), 0 + radians,
        math.pi, false, paint1);
    var paint2 = Paint()
      ..color = C.ring2
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(size.width / 2 + 20, size.height / 2 + 20) & Size(140, 140), 0,
        2 * math.pi, false, paint2);
    var paint3 = Paint()
      ..color = C.ring1
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Offset(size.width / 2 + 30, size.height / 2 + 30) & Size(120, 120), 0 - radians,
        math.pi, false, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BlurredRingsPainter extends CustomPainter {
  final double radians;
  BlurredRingsPainter(this.radians);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = C.ring4
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5);
    canvas.drawArc(
        Offset(size.width / 2, size.height / 2) & Size(180, 180), 0, 2 * math.pi, false, paint);
    var paint1 = Paint()
      ..color = C.ring3
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5);
    canvas.drawArc(Offset(size.width / 2 + 10, size.height / 2 + 10) & Size(160, 160), 0 + radians,
        math.pi, false, paint1);
    var paint2 = Paint()
      ..color = C.ring2
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5);
    canvas.drawArc(Offset(size.width / 2 + 20, size.height / 2 + 20) & Size(140, 140), 0,
        2 * math.pi, false, paint2);
    var paint3 = Paint()
      ..color = C.ring1
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5);
    canvas.drawArc(Offset(size.width / 2 + 30, size.height / 2 + 30) & Size(120, 120), 0 - radians,
        math.pi, false, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
