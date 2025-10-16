import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 165,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // Background gradient box
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 165,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF5D99A3), Color(0xFF007083)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),

            // Rectangle 9332 (bottom-left rotated)
            Positioned(
              left: -50,
              top: 74,
              child: Transform.rotate(
                angle: 0.7854, // 45 degrees in radians
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 112, 131, 0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // Rectangle 9331 (top-right rotated)
            Positioned(
              left: 147.77,
              top: -84.72,
              child: Transform.rotate(
                angle: 0.7854,
                child: Container(
                  width: 164.49,
                  height: 164.49,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 112, 131, 0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 13,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Rectangle 9330 (smaller rotated top shape)
            Positioned(
              left: 172.16,
              top: -64.72,
              child: Transform.rotate(
                angle: 0.7854,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 112, 131, 0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 13,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'USD 123.89',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 153,
                    // height: 35,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF007083),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.25),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Star icon
                        Icon(Icons.star, color: Color(0xFFFF9531), size: 20),
                        const SizedBox(width: 5),
                        Text(
                          'Basic Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
