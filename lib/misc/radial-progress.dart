import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          size: Size(
            200,
            200,
          ),
          painter: RadialPainter(),
        ),
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Сейчас"),
              Text("123", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Text("-12 кг"),
            ],
          ),
        ),
        Positioned(
          left: 0,
          child: Icon(
            Boxicons.bx_right_arrow,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class RadialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 3, paint);

    Paint paintProgress = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 3),
        math.radians(-180), math.radians(189), false, paintProgress);

    Paint paintInnerCircle = Paint()
      ..color = HSLColor.fromColor(Colors.red).withLightness(0.7).toColor()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 30;

    canvas.drawCircle(center, size.width / 3 - 5, paintInnerCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}