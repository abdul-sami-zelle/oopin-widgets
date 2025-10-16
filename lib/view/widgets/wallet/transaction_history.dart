import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: MediaQuery.of(context).size.width - 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: const Color(0xFF007083),
                ),
              ),
              Text(
                'Total (6)',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: const Color(0xFF007083),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Transaction List
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TransactionTile(
                imageUrl: 'assets/img/person-img.png', // replace later
                title: 'Payment from John Peterson',
                date: '2023-12-07 at 12:50',
                amount: '\$2',
              ),
              const SizedBox(height: 8),
              TransactionTile(
                imageUrl: 'assets/img/person-img.png', // replace later
                title: 'Payment from Anna Smith',
                date: '2023-12-06 at 10:25',
                amount: '\$10',
              ),
              const SizedBox(height: 8),
              TransactionTile(
                imageUrl: 'assets/img/person-img.png', // replace later
                title: 'Payment from Kevin Liu',
                date: '2023-12-05 at 09:40',
                amount: '\$5',
              ),
              const SizedBox(height: 8),
              TransactionTile(
                imageUrl: 'assets/img/person-img.png', // replace later
                title: 'Payment from Maria Gomez',
                date: '2023-12-04 at 15:30',
                amount: '\$8',
              ),
              const SizedBox(height: 8),
              TransactionTile(
                imageUrl: 'assets/img/person-img.png', // replace later
                title: 'Payment from David Green',
                date: '2023-12-03 at 11:10',
                amount: '\$3',
              ),
              const SizedBox(height: 8),
              TransactionTile(
                imageUrl: 'assets/img/person-img.png', // replace later
                title: 'Payment from Alice Cooper',
                date: '2023-12-02 at 14:45',
                amount: '\$6',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String amount;

  const TransactionTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083), width: 1),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 4),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset(
              imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),

          // Name + Date Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: const Color(0xFF007083),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: const Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),

          // Amount Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Amount',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  color: const Color(0xFF007083),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: const Color(0xFF007083),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
