import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: [
        RadialAxis(
          radiusFactor: .8,
          pointers: const [
            RangePointer(
              value: 95,
              width: 50,
              cornerStyle: CornerStyle.bothCurve,
              gradient: SweepGradient(
                colors: [
                  Color(0xFFFF8209),
                ],
                // stops: [.1, .75],
              ),
            ),
          ],
          axisLineStyle: AxisLineStyle(
            thickness: 50,
            color: Colors.white.withOpacity(0.3),
          ),
          startAngle: 1,
          endAngle: 1,
          showLabels: false,
          showTicks: false,
          annotations: const [
            GaugeAnnotation(
              widget: Text(
                'CGPA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              angle: 270,
              positionFactor: 0.18,
            ),
            GaugeAnnotation(
              widget: Text(
                '3.88',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              angle: 270,
              verticalAlignment: GaugeAlignment.near,
              positionFactor: 0.08,
            ),
          ],
        ),
      ],
    );
  }
}
