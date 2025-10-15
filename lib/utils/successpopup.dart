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
        width: MediaQuery.of(context).size.width,
        // height: 270,
        padding: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circle background
            Container(
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
            SizedBox(height: 10),

            // Title
            Center(
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
            SizedBox(height: 15),
            // Content
            Text(
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
            SizedBox(height: 15),
            // Close button
            GestureDetector(
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
          ],
        ),
      ),
    );
  }
}
