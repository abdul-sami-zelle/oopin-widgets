import 'package:flutter/material.dart';

class PaymentOptionCard extends StatelessWidget {
  final String heading;
  final String description;
  final String imagePath;

  const PaymentOptionCard({
    super.key,
    required this.heading,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      // height: 51,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF007083),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),

          // Image section
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              // image: DecorationImage(
              //   image: AssetImage(imagePath),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Image.asset(imagePath,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
