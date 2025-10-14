// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      // height: 235,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Services Usage",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color(0xFF007083),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 340,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(105, 98, 187, 0.2),
                  blurRadius: 6,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: CustomLineChart(
                width: MediaQuery.of(context).size.width - 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomLineChart extends StatelessWidget {
  double width;
  CustomLineChart({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size:  Size(width, 300), painter: LineChartPainter());
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> dataPoints = [60, 40, 40, 20]; // Y positions
  final List<String> xLabels = ["Food", "Careers", "Resturant", "Cars"];
  final List<String> yLabels = ["20", "15", "10", "5", "0"];

  @override
  void paint(Canvas canvas, Size size) {
    final Paint gridPaint =
        Paint()
          ..color = const Color(0xFFF0F0F0)
          ..strokeWidth = 1;

    final Paint linePaint =
        Paint()
          ..color = const Color(0xFF007083)
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final Paint dashedPaint =
        Paint()
          ..color = const Color(0xFF007083)
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;

    final Paint dotPaint =
        Paint()
          ..color = const Color(0xFF007083)
          ..style = PaintingStyle.fill;

    final double chartLeft = 28;
    final double chartTop = 10;
    final double chartWidth = size.width - chartLeft - 10;
    final double chartHeight = size.height - 25;

    // Draw horizontal gridlines (Y-axis)
    for (int i = 0; i <= 4; i++) {
      final double y = chartTop + (chartHeight / 4) * i;
      canvas.drawLine(
        Offset(chartLeft, y),
        Offset(size.width - 5, y),
        gridPaint,
      );
    }

    // Draw vertical gridlines (X-axis)
    final stepX = chartWidth / (dataPoints.length - 1);
    for (int i = 0; i < dataPoints.length; i++) {
      final double x = chartLeft + stepX * i;
      canvas.drawLine(
        Offset(x, chartTop),
        Offset(x, chartTop + chartHeight),
        gridPaint,
      );
    }

    // Draw line path connecting points
    final path = Path();
    for (int i = 0; i < dataPoints.length; i++) {
      final x = chartLeft + stepX * i;
      final y = chartTop + dataPoints[i];
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, linePaint);

    // Draw data points and dashed helper lines
    for (int i = 0; i < dataPoints.length; i++) {
      final x = chartLeft + stepX * i;
      final y = chartTop + dataPoints[i];

      // Circle point
      canvas.drawCircle(Offset(x, y), 4, dotPaint);

      // Draw dashed vertical line
      const dashWidth = 4.0;
      const dashSpace = 4.0;
      double dashY = y;
      while (dashY < chartTop + chartHeight) {
        canvas.drawLine(
          Offset(x, dashY),
          Offset(x, dashY + dashWidth),
          dashedPaint,
        );
        dashY += dashWidth + dashSpace;
      }

      // Draw label above point
      final textPainter = TextPainter(
        text: TextSpan(
          text: "${12 + i}", // example label values 12,13,13,14
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xFF007083),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(canvas, Offset(x - 8, y - 25));
    }

    // Draw Y-axis labels
    for (int i = 0; i < yLabels.length; i++) {
      final tp = TextPainter(
        text: TextSpan(
          text: yLabels[i],
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            color: Color(0xFF535353),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      final y = chartTop + (chartHeight / 4) * i - tp.height / 2;
      tp.paint(canvas, Offset(0, y));
    }

    // Draw X-axis labels
    for (int i = 0; i < xLabels.length; i++) {
      final tp = TextPainter(
        text: TextSpan(
          text: xLabels[i],
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            color: Color(0xFF535353),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      final x = chartLeft + stepX * i - tp.width / 2;
      tp.paint(canvas, Offset(x, chartTop + chartHeight + 8));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
