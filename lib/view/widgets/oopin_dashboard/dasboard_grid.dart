import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        // Box 1 - Your Wallet
        DashboardCardLarge(
          title: "Your Wallet",
          mainValue: "\$2.50",
          totalLabel: "Total Earning",
          totalValue: "\$220.00",
          iconPath: "assets/img/d-wallet.png",
        ),

        // Box 2 - Successful Opinions
        DashboardCardLarge(
          title: "Successful Opinions",
          mainValue: "94",
          totalLabel: "Total Opinions",
          totalValue: "104",
          iconPath: "assets/img/d-oopins.png",
          subText: "Opinions",
        ),

        // Box 3 - Profile
        DashboardCardSmall(
          title: "Profile",
          iconPath: "assets/img/d-profile.png",
        ),

        // Box 4 - Get Help
        DashboardCardSmall(
          title: "Get Help",
          iconPath: "assets/img/d-help.png",
        ),

        // Box 5 - Add Service (Full width)
        DashboardCardFull(
          title: "Add Service",
          iconPath: "assets/img/d-settings.png",
        ),
      ],
    );
  }
}

//
// 🔹 Reusable Large Card (e.g. Wallet, Opinions)
//
class DashboardCardLarge extends StatelessWidget {
  final String title;
  final String mainValue;
  final String totalLabel;
  final String totalValue;
  final String iconPath;
  final String? subText;

  const DashboardCardLarge({
    super.key,
    required this.title,
    required this.mainValue,
    required this.totalLabel,
    required this.totalValue,
    required this.iconPath,
    this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      // height: 122,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon top-left
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  // color: const Color(0xFF007083),
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(iconPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 1,
                    color: Color(0xFF007083),
                  ),
                ),
              ),
            ],
          ),
              SizedBox(width: 10),

          // Main value
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                mainValue,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Color(0xFF007083),
                ),
              ), // Optional subtext (like "Opinions")
              SizedBox(width: 5),
              if (subText != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    subText!,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF007083),
                    ),
                  ),
                ),
            ],
          ),
              SizedBox(width: 15),

          // Bottom row - total label and value
          SizedBox(
            width: 145,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  totalLabel,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color(0xFF757575),
                  ),
                ),
                Text(
                  totalValue,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF007083),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// 🔹 Small Half-width Card (Profile, Get Help)
//
class DashboardCardSmall extends StatelessWidget {
  final String title;
  final String iconPath;

  const DashboardCardSmall({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      // height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              // color: const Color(0xFF007083),
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(iconPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF007083),
            ),
          ),
        ],
      ),
    );
  }
}

//
// 🔹 Full-width Card (Add Service)
//
class DashboardCardFull extends StatelessWidget {
  final String title;
  final String iconPath;

  const DashboardCardFull({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      // height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              // color: const Color(0xFF007083),
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(iconPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color(0xFF007083),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
