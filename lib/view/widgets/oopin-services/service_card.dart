import 'package:flutter/material.dart';

class OopinServiceCard extends StatefulWidget {
  final String title;
  final int impressions;
  final int searches;

  const OopinServiceCard({
    super.key,
    required this.title,
    required this.impressions,
    required this.searches,
  });

  @override
  State<OopinServiceCard> createState() => _OopinServiceCardState();
}

class _OopinServiceCardState extends State<OopinServiceCard> {
  bool isSelected = true; // Initially filled circle

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isSelected = !isSelected),
      child: Container(
        width: (MediaQuery.of(context).size.width - 30) / 2,
        // height: 65,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF007083)),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 6),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            // Main content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xFF007083),
                  ),
                ),
                const SizedBox(height: 5),

                // Bottom row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Impressions column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Impressions",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                            color: Color(0xFF757575),
                          ),
                        ),
                        Text(
                          widget.impressions.toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFF007083),
                          ),
                        ),
                      ],
                    ),

                    // Searches column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Searches",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                            color: Color(0xFF757575),
                          ),
                        ),
                        Text(
                          widget.searches.toString(),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFF007083),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            // Toggle circle
            Positioned(
              right: 0,
              top: 2,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? const Color(0xFF007083) : Colors.white,
                  border: Border.all(color: const Color(0xFF007083), width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
