import 'package:flutter/material.dart';

class OopinInfoCard extends StatelessWidget {
  final String label;
  final String content;
  final String imagePath;
  final double imageSize;

  const OopinInfoCard({
    super.key,
    required this.label,
    required this.content,
    required this.imagePath,
    this.imageSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(1, 1)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // important for tall content
        children: [
          // Icon box
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF007083),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Text area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1,
                    color: Color(0xFF535353),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  content,
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
          ),
        ],
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        OopinInfoCard(
          label: "Full Name",
          content: "Michael Smith",
          imagePath: "assets/img/user.png",
        ),
        OopinInfoCard(
          label: "Email",
          content: "smith.m@gmail.com",
          imagePath: "assets/img/email.png",
        ),
        OopinInfoCard(
          label: "Date of Birth",
          content: "12 October 1997",
          imagePath: "assets/img/dob.png",
        ),
        OopinInfoCard(
          label: "Contact",
          content: "+44 11 6252 6262",
          imagePath: "assets/img/contact.png",
        ),
        OopinInfoCard(
          label: "City",
          content: "London",
          imagePath: "assets/img/location.png",
        ),
        OopinInfoCard(
          label: "About",
          content:
              "I am a seasoned career consultant with years of experience helping individuals find the right career direction. "
              "I specialize in analyzing strengths, interests, and market trends to provide personalized guidance. "
              "My approach focuses on building clarity, confidence, and actionable plans for success.",
          imagePath: "assets/img/about.png",
        ),
      ],
    );
  }
}
