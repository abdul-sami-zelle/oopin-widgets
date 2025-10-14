import 'package:flutter/material.dart';

class EndCallDialog extends StatelessWidget {
  final VoidCallback? onYes;
  final VoidCallback? onNo;

  const EndCallDialog({super.key, this.onYes, this.onNo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 15),
        width: MediaQuery.of(context).size.width,
        // height: 166,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFf0f0f0), width: 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title "End Call"
            Center(
              child: Text(
                "End Call",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Color(0xFFC61B1A),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Question
            Center(
              child: Text(
                "Are you sure you want to end this call?",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFF535353),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // NO Button
                GestureDetector(
                  onTap: onNo,
                  child: Container(
                    width: 130,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xFFC61B1A),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "NO",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // YES Button
                GestureDetector(
                  onTap: onYes,
                  child: Container(
                    width: 130,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFC61B1A)),
                    ),
                    child: const Center(
                      child: Text(
                        "YES",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFFC61B1A),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Optional hidden elements (X circle or progress bar) can be added here
            // e.g., Rectangle 9314 or X circle
          ],
        ),
      ),
    );
  }
}
