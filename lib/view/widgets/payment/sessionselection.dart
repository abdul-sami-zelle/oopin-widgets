import 'package:flutter/material.dart';

class SessionSelection extends StatefulWidget {
  const SessionSelection({super.key});

  @override
  State<SessionSelection> createState() => _SessionSelectionState();
}

class _SessionSelectionState extends State<SessionSelection> {
  int? selectedIndex;

  final List<Map<String, String>> sessions = [
    {
      "duration": "2 min chat",
      "price": "\$2.5",
      "image": "assets/img/videocam.png",
    },
    {
      "duration": "4 min chat",
      "price": "\$5",
      "image": "assets/img/videocam.png",
    },
    {
      "duration": "6 min chat",
      "price": "\$7.5",
      "image": "assets/img/videocam.png",
    },
    {
      "duration": "8 min chat",
      "price": "\$10",
      "image": "assets/img/videocam.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Only keep selected session visible if one is chosen
    final visibleSessions =
        selectedIndex == null ? sessions : [sessions[selectedIndex!]];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      width: MediaQuery.of(context).size.width - 20,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF007083),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Shrinks dynamically
        children: [
          // 🔹 Heading + Clear Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sessions',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              if (selectedIndex != null)
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(30, 20),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = null; // 🧹 Clear selection
                    });
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),

          const Text(
            'Please Select Session',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),

          // 🔹 Session Cards
          Column(
            children: List.generate(visibleSessions.length, (index) {
              final item = visibleSessions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SessionCard(
                  duration: item["duration"]!,
                  price: item["price"]!,
                  imagePath: item["image"]!,
                  isSelected: selectedIndex != null,
                  onSelect: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final String duration;
  final String price;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onSelect;

  const SessionCard({
    super.key,
    required this.duration,
    required this.price,
    required this.imagePath,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF0F0F0)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          // Image/Icon
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Text
          Expanded(
            child: Text(
              '$duration - $price',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Color(0xFF007083),
              ),
            ),
          ),

          // Select Button
          GestureDetector(
            onTap: onSelect,
            child: Container(
              // width: 60,
              height: 22,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF007083),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                isSelected ? 'Selected' : 'Select',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
