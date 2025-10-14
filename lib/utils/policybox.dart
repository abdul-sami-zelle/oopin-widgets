import 'package:flutter/material.dart';

class SimpleInfoTile extends StatelessWidget {
  final String title;       // e.g. "Refund Policy"
  final String imagePath;   // e.g. "assets/icons/refund.png"
  final double width;       // e.g. 165
  final bool isNetwork;     // for network vs asset image

  const SimpleInfoTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.width,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF007083),
                height: 1.3,
              ),
            ),
          ),

          // Image Box
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF007083),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: isNetwork
                  ? Image.network(imagePath, width: 20, height: 20, fit: BoxFit.contain)
                  : Image.asset(imagePath, width: 20, height: 20, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
