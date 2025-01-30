import 'package:flutter/material.dart';
//
class VerticalLineProgressPainter extends CustomPainter {
  final double progress;
  VerticalLineProgressPainter(this.progress);


  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Color(0xffF4F4F4)
      ..strokeWidth = 50
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint progressPaint = Paint()
      ..color = Color(0xff218130)
      ..strokeWidth = 50
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Offset start = Offset(size.width / 2, size.height);
    Offset end = Offset(size.width / 2, 0);
    canvas.drawLine(start, end, backgroundPaint);

    double progressHeight = (progress / 300) * size.height;
    Offset progressEnd = Offset(size.width / 2, size.height - progressHeight);
    canvas.drawLine(start, progressEnd, progressPaint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
  return true;
  }
}
