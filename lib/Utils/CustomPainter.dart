import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(overflow: Overflow.visible, children: <Widget>[
              CustomPaint(
                painter: CustomBackgroundPainter(),
                child: Container(
                  height: double.infinity,
                ),
              ),
            ])));
  }
}

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path orangePath = Path();
    orangePath.lineTo(0.0, size.height);

    orangePath.lineTo(size.width * .25, size.height);

    var orangePathcontrolPoints =
    Offset(size.width * .30 + 20, size.height - 80.0);
    var orangePathendPoints = Offset(size.width * .65, size.height - 60.0);

    orangePath.quadraticBezierTo(
        orangePathcontrolPoints.dx,
        orangePathcontrolPoints.dy,
        orangePathendPoints.dx,
        orangePathendPoints.dy);

    var orangePathcontrolPoints2 = Offset(size.width - 40, size.height - 70);
    var orangePathendPoints2 = Offset(size.width, size.height * .75);

    orangePath.quadraticBezierTo(
        orangePathcontrolPoints2.dx,
        orangePathcontrolPoints2.dy,
        orangePathendPoints2.dx,
        orangePathendPoints2.dy);

    orangePath.lineTo(size.width, size.height * 0.7);
    orangePath.lineTo(size.width, 0.0);
    orangePath.close();
    paint.color = Color(0xFF594e76);

    canvas.drawPath(orangePath, paint);

    final Path path = Path();
    path.lineTo(0.0, size.height * 0.5 - 10);

    var controlPoints = Offset(size.width / 4, size.height * 0.4 - 30.0);
    var endPoints = Offset(size.width / 2, size.height * 0.5 - 55.0);

    path.quadraticBezierTo(
        controlPoints.dx, controlPoints.dy, endPoints.dx, endPoints.dy);

    var controlPoints2 =
    Offset((size.width - size.width / 4), size.height * 0.5 - 30);

    var endPoints2 = Offset(size.width, size.height * 0.4 - 70.0);
    path.quadraticBezierTo(
        controlPoints2.dx, controlPoints2.dy, endPoints2.dx, endPoints2.dy);

    path.lineTo(size.width, size.height * .30);
    path.lineTo(size.width, 0.0);
    path.close();

    paint.color = Color(0xFF2a1c4d);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class ChatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path path = Path();
    path.lineTo(0.0, size.height*0.5);

    path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height);

    path.quadraticBezierTo((size.width - size.width/4), size.height, size.width, size.height*0.5-10);
    path.lineTo(size.width, size.height*0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    paint.color = Color(0xFF2a1c4d);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate!=this;
  }
}