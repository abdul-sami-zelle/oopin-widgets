import 'package:flutter/material.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback? onCancel;
  final VoidCallback? onDelete;

  const DeleteAccountDialog({super.key, this.onCancel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 213,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFf0f0f0), width: 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title "Delete Account"
            Text(
              "Delete Account",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
                height: 16 / 15,
              ),
            ),
            SizedBox(height: 10),

            // Confirmation Text
            Text(
              "Are you sure you want to delete your account?",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(0xFF535353),
              ),
            ),
            SizedBox(height: 10),

            // Warning Box
            Container(
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              // height: 84,
              decoration: BoxDecoration(
                color: Color(0x33C61B1A), // rgba(198,27,26,0.2)
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // Icon image
                  Row(
                    children: [
                      Image.asset(
                        "assets/img/warning.png",
                        width: 20,
                        height: 20,
                        color: Color(0xffc61b1a),
                      ),
                      SizedBox(width: 10),
                      // Warning text
                      Text(
                        "Warning",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFFC61B1A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Description
                  SizedBox(
                    width: 290,
                    child: Text(
                      "By deleting this account all your saved data will be lost permanently.",
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xFFC61B1A),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Buttons Row
            SizedBox(
              width: 320,
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel Button
                  GestureDetector(
                    onTap: onCancel,
                    child: Container(
                      width: 130,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Delete Account Button
                  GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      width: 180,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFC61B1A)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "Delete Account",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFFC61B1A),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
