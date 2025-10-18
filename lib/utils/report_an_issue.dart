import 'package:flutter/material.dart';

class ReportIssueSection extends StatefulWidget {
  const ReportIssueSection({super.key});

  @override
  State<ReportIssueSection> createState() => _ReportIssueSectionState();
}

class _ReportIssueSectionState extends State<ReportIssueSection> {
  int? selectedIndex;
  final TextEditingController reasonController = TextEditingController();

  final List<Map<String, String>> reasons = [
    {
      "title": "Payment Error",
      "description": "Did not receive payment, less payment or more payment."
    },
    {
      "title": "Misbehave",
      "description":
          "Client performed any sort of inappropriate activity or gestures."
    },
    {
      "title": "Video Call Problem",
      "description": "There is distortion in video call session."
    },
    {
      "title": "Others",
      "description": "Reasons not listed above"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "What went wrong",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF007083),
              ),
            ),
          ),

          // Reason options
          Column(
            children: List.generate(reasons.length, (index) {
              final item = reasons[index];
              final bool isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFF007083),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Custom checkbox
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF007083)
                              : Colors.white,
                          border: Border.all(
                            color: const Color(0xFF007083),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      const SizedBox(width: 10),

                      // Title and description
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"]!,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1,
                                color: Color(0xFF007083),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["description"]!,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                height: 1,
                                color: Color(0xFF535353),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),

          // Text field (always visible)
          Container(
            width: 340,
            height: 83,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF007083)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: reasonController,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              expands: true,
              maxLines: null,
              minLines: null,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 1.2,
                color: Color(0xFF007083),
              ),
              decoration: const InputDecoration(
                hintText: "Please write your reason here...",
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xFF535353),
                ),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
