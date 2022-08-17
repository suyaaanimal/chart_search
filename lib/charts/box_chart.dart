import 'package:flutter/material.dart';

class BoxChart extends StatelessWidget {
  const BoxChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        color: Colors.black,
        child: SizedBox.expand(
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  List<int> data = [
    0,
    1,
    1,
    2,
    2,
    3,
    2,
    1,
    2,
    3,
    2,
    2,
    1,
    1,
    3,
    2,
  ];
  @override
  void paint(Canvas canvas, Size size) {
    double blockWidth = size.width / data.length;
    double blockHeight = blockWidth * 0.6;
    final paint = [
      Paint()..color = Colors.red,
      Paint()..color = Colors.blue,
      Paint()..color = Colors.blueGrey,
      Paint()..color = Colors.purple
    ];
    for (var i = 0; i < data.length; i++) {
      final rect = Rect.fromLTWH(
          blockWidth * i, data[i] * blockHeight, blockWidth, blockHeight);
      canvas.drawRect(rect, paint[data[i]]);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
