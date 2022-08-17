import 'dart:math';

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
  List nums = [
    {
      'label': 'Graph Width',
      'num': 300.0,
      'max': 300.0,
      'min': 0.0,
      'div': null,
    },
    {
      'label': 'Data num',
      'num': 16.0,
      'max': 100.0,
      'min': 1.0,
      'div': 99,
    },
    {
      'label': 'block height / width',
      'num': 0.6,
      'max': 3.0,
      'min': 0.0,
      'div': null,
    }
  ];
  List<int> rand(int l) {
    final rand = Random();
    return List.generate(l, (index) => rand.nextInt(4));
  }

  var data;

  @override
  void initState() {
    super.initState();
    data = rand(nums[1]['max'].toInt());
  }

  @override
  Widget build(BuildContext context) {
    final d = List.from(data)..length = nums[1]['num'].toInt();
    nums[0]['max'] = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 100),
              color: colors[4],
              child: SizedBox(
                width: nums[0]['num'],
                height: 100.0 +
                    4 * nums[0]['num'] / nums[1]['num'] * nums[2]['num'],
                child: CustomPaint(
                  painter: MyPainter(d, colors, nums[2]['num']),
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
            for (final n in nums)
              Row(
                children: [
                  Text(
                      '${n['label']}: ${(n['num'] * 10).round().toDouble() / 10}'),
                  Slider(
                      divisions: n['div'],
                      min: n['min'],
                      max: n['max'],
                      value: n['num'],
                      onChanged: (value) => setState(() => n['num'] = value))
                ],
              ),
            ElevatedButton(
                onPressed: () =>
                    setState(() => data = rand(nums[1]['max'].toInt())),
                child: const Text('Reload the data')),
          ]),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(
    this.data,
    this.colors,
    this.blockRatio,
  );
  final rand = Random();
  final List data;
  List<Color> colors;
  final double blockRatio;

  @override
  void paint(Canvas canvas, Size size) {
    double blockWidth = size.width / data.length;
    double blockHeight = blockWidth * blockRatio;
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
