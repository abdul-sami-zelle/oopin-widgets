import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final String imagePath; // can be asset or network URL
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF007083),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (_, __, ___) => const Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 20,
                      ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 60,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              height: 1,
              color: const Color(0xFF007083),
            ),
          ),
        ),
      ],
    );
  }
}

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 297,
      child: SizedBox(
        width: 340,
        height: 94,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionButton(
              title: "Transfer Amount",
              imagePath: "https://via.placeholder.com/40",
              onTap: () => debugPrint("Transfer clicked"),
            ),
            ActionButton(
              title: "Add Amount",
              imagePath: "https://via.placeholder.com/40",
              onTap: () => debugPrint("Add clicked"),
            ),
            ActionButton(
              title: "History",
              imagePath: "https://via.placeholder.com/40",
              onTap: () => debugPrint("History clicked"),
            ),
            ActionButton(
              title: "More",
              imagePath: "https://via.placeholder.com/40",
              onTap: () => debugPrint("More clicked"),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: const [
          // Your balance card from before
          Positioned(
            top: 130,
            left: 10,
            child: Placeholder(fallbackHeight: 152, fallbackWidth: 340),
          ),
          // This new action row
          ActionRow(),
        ],
      ),
    );
  }
}
