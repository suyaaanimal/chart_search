import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BoxChart extends StatefulWidget {
  const BoxChart({Key? key}) : super(key: key);

  @override
  State<BoxChart> createState() => _BoxChartState();
}

class _BoxChartState extends State<BoxChart> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.blueGrey,
    Colors.purple,
    Colors.black
  ];
  final pickerButtonText = [
    'Awake color',
    'REM color',
    'Light color',
    'Deep color',
    'Background color'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 100),
          color: colors[4],
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: CustomPaint(
              painter: MyPainter(colors),
            ),
          ),
        ),
        for (var i = 0; i < 5; i++)
          ElevatedButton(
              child: Text(pickerButtonText[i]),
              onPressed: () {
                var pickerColor = colors[i];
                showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          content: SingleChildScrollView(
                              child: ColorPicker(
                            pickerColor: pickerColor,
                            onColorChanged: (value) =>
                                setState(() => pickerColor = value),
                          )),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() => colors[i] = pickerColor);
                                  Navigator.pop(context);
                                },
                                child: const Text('Set'))
                          ],
                        )));
              }),
      ]),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(this.colors);
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
  List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    double blockWidth = size.width / data.length;
    double blockHeight = blockWidth * 0.6;
    final paint = List.generate(4, (index) => Paint()..color = colors[index]);
    for (var i = 0; i < data.length; i++) {
      final rect = Rect.fromLTWH(
          blockWidth * i, data[i] * blockHeight, blockWidth, blockHeight);
      canvas.drawRect(rect, paint[data[i]]);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
