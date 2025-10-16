import 'package:flutter/material.dart';

class CustomStatsChart extends StatelessWidget {
  const CustomStatsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      // height: 419,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Chart container

          // Total Balance Section
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF535353),
                    ),
                  ),
                  // Date indicator
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 15,
                        color: Color(0xFF757575),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '16 June 2025',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'USD 665.90',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Color(0xFF007083),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // Legend
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _LegendBox(color: Color(0xFF007083)),
                  SizedBox(width: 10),
                  Text(
                    'Matured Amount',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1,
                      color: Color(0xFF535353),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  _LegendBox(color: Color(0xFF62B1F2)),
                  SizedBox(width: 10),
                  Text(
                    'Un Matured Amount',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      height: 1,
                      color: Color(0xFF535353),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),

          // Graph Box
          Container(
            width: 340,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(105, 98, 187, 0.2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: CustomPaint(painter: ChartPainter()),
          ),
          SizedBox(height: 20),

          // Box: Total Income
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatBox(
                img: 'assets/img/income.png',
                title: 'Total Income',
                value: '\$150.50',
              ),
              // Box: Total Withdraws
              _StatBox(
                img: 'assets/img/withdraw.png',
                title: 'Total Withdraws',
                value: '\$27.50',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendBox extends StatelessWidget {
  final Color color;
  const _LegendBox({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String img;
  final String title;
  final String value;

  const _StatBox({required this.img, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 30) / 2,
      // height: 95,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon(icon, color: const Color(0xFF007083), size: 30),
              SizedBox(height: 30, width: 30, child: Image.asset(img)),
              SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Color(0xFF007083),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              height: 1,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Color(0xFF007083),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint =
        Paint()
          ..color = const Color(0xFFF0F0F0)
          ..strokeWidth = 1;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Draw horizontal grid lines and Y-axis labels
    const yLabels = ['100', '75', '50', '25', '0'];
    for (int i = 0; i < yLabels.length; i++) {
      double y = (i * (size.height - 20) / 4) + 10;
      canvas.drawLine(Offset(38, y), Offset(size.width - 10, y), gridPaint);

      textPainter.text = TextSpan(
        text: '\$${yLabels[i]}',
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          color: Color(0xFF535353),
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(10, y - 5));
    }

    // Draw vertical grid lines
    const xSteps = 7;
    for (int i = 0; i < xSteps; i++) {
      double x = 38 + i * ((size.width - 48) / (xSteps - 1));
      canvas.drawLine(Offset(x, 10), Offset(x, size.height - 25), gridPaint);
    }

    // X labels
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    for (int i = 0; i < days.length; i++) {
      double x = 38 + i * ((size.width - 48) / (days.length - 1)) - 12;
      textPainter.text = TextSpan(
        text: days[i],
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          color: Color(0xFF535353),
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x, size.height - 15));
    }

    // Graph lines
    final matured = [0.1, 0.5, 0.3, 0.6, 0.7, 0.9, 0.5];
    final unmatured = [0.3, 0.4, 0.2, 0.5, 0.6, 0.8, 0.4];

    _drawLine(canvas, size, matured, const Color(0xFF007083));
    _drawLine(canvas, size, unmatured, const Color(0xFF62B1F2));
  }

  void _drawLine(Canvas canvas, Size size, List<double> data, Color color) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final path = Path();
    final dx = (size.width - 48) / (data.length - 1);
    for (int i = 0; i < data.length; i++) {
      double x = 38 + i * dx;
      double y = (1 - data[i]) * (size.height - 40) + 10;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);

    // Add gradient fill
    final fillPath =
        Path.from(path)
          ..lineTo(38 + dx * (data.length - 1), size.height - 25)
          ..lineTo(38, size.height - 25)
          ..close();

    final gradient = LinearGradient(
      colors: [color.withOpacity(0.3), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final fillPaint =
        Paint()
          ..shader = gradient.createShader(
            Rect.fromLTWH(0, 0, size.width, size.height),
          )
          ..style = PaintingStyle.fill;

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
