import 'package:flutter/material.dart';
import 'package:oopin/view/widgets/reviews/reviewcard.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  final List<Reviewcard> reviewItems = const [
    Reviewcard(
      name: 'John Peterson',
      date: '10 May 2025 12:35:00 PM',
      review:
          'Amazing consultation! Helped me gain clarity about my career path in just one session.',
      rating: '5',
      imagepath: 'assets/img/person-img.png',
    ),
    Reviewcard(
      name: 'Sophia Lee',
      date: '08 May 2025 09:10:00 AM',
      review:
          'Very insightful and kind mentor! Shared a lot of useful advice for improving my portfolio.',
      rating: '4.5',
      imagepath: 'assets/img/person-img.png',
    ),
    Reviewcard(
      name: 'Michael Brown',
      date: '05 May 2025 04:22:00 PM',
      review:
          'Good session overall, but I wish there was more focus on personal branding tips.',
      rating: '4',
      imagepath: 'assets/img/person-img.png',
    ),
    Reviewcard(
      name: 'Ava Williams',
      date: '03 May 2025 02:45:00 PM',
      review:
          'Very professional and easy to talk to. I left the session feeling much more confident!',
      rating: '5',
      imagepath: 'assets/img/person-img.png',
    ),
    Reviewcard(
      name: 'Daniel Garcia',
      date: '01 May 2025 07:18:00 PM',
      review:
          'Loved the experience! Helped me refine my resume and better understand my strengths.',
      rating: '4.8',
      imagepath: 'assets/img/person-img.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      height: 450,
      child: ListView.builder(
        itemCount: reviewItems.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = reviewItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ReviewCard(review: item),
          );
        },
      ),
    );
  }
}

class Reviewcard {
  final String? name;
  final String? date;
  final String? review;
  final String? rating;
  final String? imagepath;

  const Reviewcard({
    this.name,
    this.date,
    this.review,
    this.rating,
    this.imagepath,
  });
}
