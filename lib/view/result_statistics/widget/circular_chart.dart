import 'package:diu_result/controller/semester_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SemesterResultController>();

    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: [
        RadialAxis(
          radiusFactor: 0.8,
          pointers: [
            RangePointer(
              value: controller.percentage,
              width: 50,
              cornerStyle: CornerStyle.bothCurve,
              gradient: const SweepGradient(
                colors: [
                  Color(0xFFFF8209),
                ],
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
          annotations: [
            const GaugeAnnotation(
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
                controller.cgpa.toStringAsFixed(2),
                style: const TextStyle(
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
