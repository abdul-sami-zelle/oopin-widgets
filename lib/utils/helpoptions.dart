import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String title;         // e.g. "Contact Us"
  final String subtitle;      // e.g. "You can ask us for any help."
  final String imagePath;     // e.g. "assets/icons/help.png"
  final double width;         // e.g. 165
  final bool isNetwork;       // for network vs asset image

  const InfoTile({
    super.key,
    required this.title,
    required this.subtitle,
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
          // Text Section
          SizedBox(
            width: width - 45, // ensures text fits nicely beside image box
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xFF007083),
                    height: 1.3,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                    color: Color(0xFF535353),
                    height: 1,
                  ),
                ),
              ],
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
