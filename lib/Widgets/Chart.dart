import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../constants/Constants.dart';

class ChartDisplay extends StatelessWidget {
  const ChartDisplay({
    @required this.bmiVal,
  });

  final double bmiVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.50,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 5000,
        axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 50,
              radiusFactor: MediaQuery.of(context).size.width * 0.0020,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 15,
                    color: Colors.red[400],
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 15,
                    endValue: 16,
                    color: Colors.red[300],
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 16,
                    endValue: 18.5,
                    color: Colors.yellow.shade200,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 18.5,
                    endValue: 25,
                    color: Colors.green.shade300,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 25,
                    endValue: 30,
                    color: Colors.yellow.shade200,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 30,
                    endValue: 35,
                    color: Colors.orange.shade300,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 35,
                    endValue: 40,
                    color: Colors.red.shade300,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 40,
                    endValue: 50,
                    color: Colors.red.shade400,
                    startWidth: 10,
                    endWidth: 10),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  enableAnimation: true,
                  animationDuration: 20.0,
                  animationType: AnimationType.bounceOut,
                  value: bmiVal,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        '${bmiVal.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: boxShadow,
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5)
              ])
        ],
      ),
    );
  }
}
