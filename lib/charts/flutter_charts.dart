import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';

class ShowcaseChartScreen extends StatefulWidget {
  const ShowcaseChartScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowcaseChartScreenState createState() => _ShowcaseChartScreenState();
}

class _ShowcaseChartScreenState extends State<ShowcaseChartScreen> {
  final _chartStates = ChartState(
    ChartData(
      [
        [
          BubbleValue.withValue(false, 3),
          BubbleValue.withValue(false, 2),
          BubbleValue.withValue(false, 2),
          BubbleValue.withValue(false, 2),
          BubbleValue.withValue(false, 1),
          BubbleValue.withValue(false, 1),
          BubbleValue.withValue(false, 0),
          BubbleValue.withValue(false, 1),
          BubbleValue.withValue(false, 1),
          BubbleValue.withValue(false, 2),
          BubbleValue.withValue(false, 2),
          BubbleValue.withValue(false, 2),
          BubbleValue.withValue(false, 1),
          BubbleValue.withValue(false, 1),
          BubbleValue.withValue(false, 1),
          BubbleValue.withValue(false, 0),
          BubbleValue.withValue(false, 3),
        ],
      ],
      axisMax: 3,
    ),
    itemOptions: const BarItemOptions(
      color: Colors.transparent,
      multiItemStack: false,
    ),
    backgroundDecorations: [
      GridDecoration(
        horizontalAxisStep: 1.0,
        showVerticalGrid: false,
        gridColor: Colors.grey.shade300,
      ),
    ],
    foregroundDecorations: [
      SparkLineDecoration(
        fill: true,
        smoothPoints: true,
        stretchLine: true,
        lineWidth: 5.0,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFA3A3),
            Color(0xFF8F66C2),
          ],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Showcase charts',
        ),
      ),
      body: Container(
        height: 300,
        padding: const EdgeInsets.all(12.0),
        child: AnimatedChart<bool>(
            duration: const Duration(milliseconds: 650), state: _chartStates),
      ),
    );
  }
}
