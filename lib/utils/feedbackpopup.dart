import 'package:flutter/material.dart';

class FeedbackCard extends StatefulWidget {
  const FeedbackCard({Key? key}) : super(key: key);

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  int selectedStars = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 290,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFf0f0f0), width: 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// "Feedback" title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Feedback",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF007083),
                  ),
                ),
                GestureDetector(
                  // onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF757575),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 12,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),

            /// "Please tell us..." subtitle
            Text(
              "Please tell us how was your experience.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Color(0xFF535353),
              ),
            ),

            SizedBox(height: 15),

            /// "Rate the Oopin."
            Text(
              "Rate the Oopin.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF007083),
              ),
            ),

            SizedBox(height: 5),

            /// Star Rating Row
            SizedBox(
              // width: 195,
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  bool isSelected = index < selectedStars;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedStars = index + 1);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? const Color(0xFFFF9531)
                                : const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 15),

            /// "Write about your experience."
            Text(
              "Write about your experience.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF007083),
              ),
            ),

            SizedBox(height: 5),

            /// Text Box for Review
            Container(
              width: 340,
              height: 85,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF535353), width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: reviewController,
                maxLines: null,
                expands: true,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1,
                  color: Color(0xFF007083),
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintText: "Write a review",
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xFF535353),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            /// Submit Button
            GestureDetector(
              onTap: () {
                // Handle submit action here
                debugPrint("Rating: $selectedStars");
                debugPrint("Review: ${reviewController.text}");
                reviewController.clear();
                setState(() => selectedStars = 0);
                // FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xFF007083),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
