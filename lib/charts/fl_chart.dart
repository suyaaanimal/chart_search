import 'package:flutter/material.dart';

import 'dart:ui';

class FlChart extends StatefulWidget {
  const FlChart({Key? key}) : super(key: key);

  @override
  State<FlChart> createState() => _FlChartState();
}

class _FlChartState extends State<FlChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://i0.wp.com/www.choge-blog.com/wp-content/uploads/2021/11/Swift-2021-11-02T183139.475.jpg',
              ),
            ),
          ),
          width: 250,
          height: 250,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: const Text('ぼかし'),
            ),
          ),
        ),
      ),
    );
  }
}
