import 'package:flutter/material.dart';

class Opinionmakerservices extends StatefulWidget {
  final String title;
  final int impressions;
  final int searches;
  final bool initiallySelected;
  final VoidCallback? onToggle;

  const Opinionmakerservices({
    super.key,
    required this.title,
    required this.impressions,
    required this.searches,
    this.initiallySelected = false,
    this.onToggle,
  });

  @override
  State<Opinionmakerservices> createState() => _LanguageStatCardState();
}

class _LanguageStatCardState extends State<Opinionmakerservices> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initiallySelected;
  }

  void toggleSelection() {
    setState(() => isSelected = !isSelected);
    widget.onToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 30) / 2,
      height: 65,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 0)),
        ],
      ),
      child: Stack(
        children: [
          // Main column content
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStat("Impressions", widget.impressions.toString()),
                  _buildStat(
                    "Searches",
                    widget.searches.toString(),
                    alignRight: true,
                  ),
                ],
              ),
            ],
          ),

          // Circle button (absolute positioned)
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: toggleSelection,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF007083) : Colors.white,
                  border: Border.all(color: const Color(0xFF007083), width: 1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, {bool alignRight = false}) {
    return Column(
      crossAxisAlignment:
          alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: Color(0xFF757575),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFF007083),
          ),
        ),
      ],
    );
  }
}
