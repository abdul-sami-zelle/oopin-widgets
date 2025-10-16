import 'package:flutter/material.dart';

class DeletionReasonSection extends StatefulWidget {
  const DeletionReasonSection({super.key});

  @override
  State<DeletionReasonSection> createState() => _DeletionReasonSectionState();
}

class _DeletionReasonSectionState extends State<DeletionReasonSection> {
  String? selectedReason;
  final TextEditingController otherController = TextEditingController();

  final List<String> reasons = [
    "Something went wrong",
    "I am not getting calls",
    "I have privacy concerns",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Delete My Profile",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  height: 1.2,
                  color: Color(0xFF007083),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Please select a reason for this request.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  height: 1.2,
                  color: Color(0xFF535353),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Reason Selection
          Column(
            children:
                reasons.map((reason) {
                  final bool isSelected = selectedReason == reason;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedReason = reason);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 340,
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF007083),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                              color:
                                  isSelected
                                      ? const Color(0xFF007083)
                                      : Colors.transparent,
                            ),
                            child:
                                isSelected
                                    ? const Icon(
                                      Icons.check,
                                      size: 10,
                                      color: Colors.white,
                                    )
                                    : null,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            reason,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xFF444444),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),

          // If "Others" selected → show input box
          if (selectedReason == "Others") ...[
            const SizedBox(height: 5),
            Container(
              width: 340,
              height: 83,
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
                controller: otherController,
                cursorColor: Color(0xff535353),
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.start,
                textAlignVertical:
                    TextAlignVertical.top, // 👈 ensures text starts at top
                minLines: 1,
                maxLines: null,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  height: 1.2,
                  color: Color(0xFF007083),
                ),
                decoration: const InputDecoration(
                  isCollapsed:
                      true, // 👈 important: disables default vertical centering
                  contentPadding: EdgeInsets.all(
                    8,
                  ), // 👈 provides manual padding
                  hintText: "Please write your reason here...",
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1.2,
                    color: Color(0xFF535353),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
