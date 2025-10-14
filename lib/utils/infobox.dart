import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String imagePath; // Path or network URL of the image
  final String label;     // Smaller gray text
  final String value;     // Larger teal text
  final bool isNetwork;   // Optional flag for network images

  const InfoCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.value,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      // height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Image Container
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
          const SizedBox(width: 10),
          
          // Text Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xFF535353),
                  height: 1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xFF007083),
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
