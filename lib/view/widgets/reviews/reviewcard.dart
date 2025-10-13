import 'package:flutter/material.dart';
import 'package:oopin/view/widgets/reviews/reviewlist.dart';

class ReviewCard extends StatelessWidget {
  final Reviewcard review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 70,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF0F0F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  review.imagepath ?? 'assets/img/person-img.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),

          // Name, date, and review text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Name and date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name ?? 'Unknown User',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1,
                        color: Color(0xFF007083),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      review.date ?? '',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 8,
                        height: 1,
                        color: Color(0xFF535353),
                      ),
                    ),
                  ],
                ),

                // Review text
                SizedBox(
                  child: Text(
                    review.review ?? 'No review provided.',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Colors.black,
                      height: 1.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),

          // Rating (top right)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                review.rating ?? '0',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFF007083),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, size: 15, color: Color(0xFFFF9531)),
            ],
          ),
        ],
      ),
    );
  }
}


