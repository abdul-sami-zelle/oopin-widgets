import 'package:flutter/material.dart';

class Cityvisited extends StatelessWidget {
  const Cityvisited({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width * 0.9; // responsive width
   

    // Example data (can be dynamic)
    final cities = ["Blackburn", "London", "Cardiff", "Oxford", "Glasgow"];
    final values = [70.0, 109.0, 99.0, 145.0, 24.0];
    final maxValue = 150.0; // reference for height scaling

    return Container(
      width: MediaQuery.of(context).size.width - 20,
      // height: height,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Text(
            "Cities Visited",
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color(0xFF007083),
            ),
          ),
          const SizedBox(height: 5),

          // Chart container
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6962BB).withOpacity(0.2),
                  blurRadius: 6,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                // Gridlines + Labels
                Positioned.fill(
                  left: 35,
                  top: 10,
                  right: 10,
                  bottom: 30,
                  child: CustomPaint(
                    painter: _GridPainter(),
                  ),
                ),

                // Bars
                Positioned(
                  left: 38,
                  top: 14,
                  right: 10,
                  bottom: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(cities.length, (i) {
                      final barHeight = (values[i] / maxValue) * 150;
                      return SizedBox(
                        width: 54,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 25,
                            height: barHeight,
                            decoration: BoxDecoration(
                              color: const Color(0xFF007083),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // Y-axis labels
                Positioned(
                  left: 10,
                  top: 10,
                  bottom: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      _YAxisLabel("20"),
                      _YAxisLabel("15"),
                      _YAxisLabel("10"),
                      _YAxisLabel("5"),
                      _YAxisLabel("0"),
                    ],
                  ),
                ),

                // X-axis labels
                Positioned(
                  left: 38,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: cities
                        .map(
                          (city) => SizedBox(
                            width: 54,
                            child: Text(
                              city,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Color(0xFF535353),
                                
                              ),
                              
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom grid painter
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF0F0F0)
      ..strokeWidth = 1;

    final horizontalLines = 5; // 0,5,10,15,20
    final verticalLines = 6; // grid divisions

    // Draw horizontal grid lines
    for (int i = 0; i <= horizontalLines; i++) {
      final dy = size.height * (i / horizontalLines);
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    // Draw vertical grid lines
    for (int i = 0; i <= verticalLines; i++) {
      final dx = size.width * (i / verticalLines);
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Small label widget for Y-axis
class _YAxisLabel extends StatelessWidget {
  final String text;
  const _YAxisLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          color: Color(0xFF535353),
        ),
      ),
    );
  }
}
