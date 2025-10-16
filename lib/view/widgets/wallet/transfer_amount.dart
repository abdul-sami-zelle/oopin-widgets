import 'package:flutter/material.dart';
import 'package:oopin/utils/textfield.dart';

class TransferAmountSection extends StatelessWidget {
  const TransferAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      // height: 309,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title: Transfer Amount
          Text(
            "Transfer Amount",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color(0xFF007083),
              height: 1.2,
            ),
          ),
          SizedBox(height: 5),

          /// --- Enter Amount Box ---
          CustomTextField(hintText: 'Enter Amount'),
          SizedBox(height: 15),

          /// --- Account Details ---
          Text(
            "Account Details",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF007083),
            ),
          ),

          Text(
            "Enter Paypal Account Details",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Color(0xFF535353),
            ),
          ),
          SizedBox(height: 10),

          /// --- Account Title Box ---
          CustomTextField(hintText: 'Account Title'),
          SizedBox(height: 5),

          /// --- Account No Box ---
          CustomTextField(hintText: 'Account No'),
          SizedBox(height: 5),

          /// --- Email / Phone Box ---
          CustomTextField(hintText: 'Email/Phone NO'),
          SizedBox(height: 5),

          /// --- Remember Account Checkbox ---
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: const Color(0xFF007083),
                  border: Border.all(color: const Color(0xFF007083)),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Icon(Icons.check, size: 11, color: Colors.white),
              ),
              const SizedBox(width: 5),
              const Text(
                "Remember Account",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xFF444444),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
