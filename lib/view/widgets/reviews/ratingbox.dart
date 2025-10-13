import 'package:flutter/material.dart';

class RatingSummaryCard extends StatelessWidget {
  const RatingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      // height: 92,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF007083),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: 330,
        // height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left section: Average Rating
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Average Rating",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF007083),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "4.2",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF007083),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.star, color: Color(0xFFFF9531), size: 30),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  "Total 5 ratings",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF007083),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // Right section: rating bars (5–1 stars)
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RatingBarRow(label: "5 star", filledWidth: 80),
                RatingBarRow(label: "4 star", filledWidth: 60),
                RatingBarRow(label: "3 star", filledWidth: 40),
                RatingBarRow(label: "2 star", filledWidth: 20),
                RatingBarRow(label: "1 star", filledWidth: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for each rating row
class RatingBarRow extends StatelessWidget {
  final String label;
  final double filledWidth; // width of filled part (out of 90)

  const RatingBarRow({
    super.key,
    required this.label,
    required this.filledWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 90,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                width: filledWidth,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFF007083),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
