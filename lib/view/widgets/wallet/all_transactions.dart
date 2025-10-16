import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      // height: 352,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Filter Row: All / Last 7 Days
          Container(
            width: 340,
            height: 32,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF007083)),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // "All" button
                Container(
                  width: 160,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFF007083),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // "Last 7 Days" button
                Container(
                  width: 160,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Last 7 Days',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF007083),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
    
          // Transaction List
          SizedBox(
            width: 340,
            // height: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: const [
                TransactionCard(
                  refNo: "1224 3233 3221",
                  date: "2023-08-09 at 11:03",
                  amount: "\$2",
                  status: "Processing",
                ),
                SizedBox(height: 10),
                TransactionCard(
                  refNo: "1293 2292 2828",
                  date: "2023-12-08 at 02:50",
                  amount: "\$2",
                  status: "Approved",
                ),
                SizedBox(height: 10),
                TransactionCard(
                  refNo: "8838 0019 8827",
                  date: "2023-01-07 at 05:00",
                  amount: "\$2",
                  status: "Approved",
                ),
                SizedBox(height: 10),
                TransactionCard(
                  refNo: "9938 8384 9928",
                  date: "2023-05-03 at 17:50",
                  amount: "\$2",
                  status: "Approved",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String refNo;
  final String date;
  final String amount;
  final String status;

  const TransactionCard({
    super.key,
    required this.refNo,
    required this.date,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // final bool isApproved = status.toLowerCase() == "approved";

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 340,
          // height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF007083)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/person-img.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Ref No and Date Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ref No section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ref No',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              height: 1,
                              color: Color(0xFF757575),
                            ),
                          ),
                          Text(
                            refNo,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1,
                              color: Color(0xFF007083),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      // Date section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Date',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              height: 1,
                              color: Color(0xFF757575),
                            ),
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 1,
                              color: Color(0xFF535353),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Amount column
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                      height: 1,
                      color: Color(0xFF757575),
                    ),
                  ),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      height: 1,
                      color: Color(0xFF007083),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Status badge (Approved/Processing)
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 73,
            height: 25,
            decoration: BoxDecoration(
              color: const Color(0xFF007083),
              border: Border.all(color: const Color(0xFF007083)),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                status,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
