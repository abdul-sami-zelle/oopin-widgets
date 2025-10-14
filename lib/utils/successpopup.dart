import 'package:flutter/material.dart';

class ClaimSubmitDialog extends StatelessWidget {
  final String title;
  final String content;
  final String centerImage; // path for the image inside the circle
  final VoidCallback? onClose;

  const ClaimSubmitDialog({
    super.key,
    required this.title,
    required this.content,
    required this.centerImage,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        height: 270,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circle background
            Positioned(
              top: 0,
              left: (360 - 80) / 2,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF007083),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(centerImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Title
            Positioned(
              top: 115,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF007083),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Content
            Positioned(
              top: 150,
              left: 10,
              right: 10,
              child: Text(
                content,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xFF535353),
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Close button
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF007083),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Close",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
