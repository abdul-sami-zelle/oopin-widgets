import 'package:flutter/material.dart';

class CallHistory extends StatelessWidget {
  final String personName;
  final String serviceName;
  final String cityName;
  final String duration;
  final String imagePath; // Can be Asset or Network

  const CallHistory({
    super.key,
    required this.personName,
    required this.serviceName,
    required this.cityName,
    required this.duration,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image (supports Asset or Network)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              image: DecorationImage(
                image: imagePath.startsWith('http')
                    ? NetworkImage(imagePath)
                    : AssetImage(imagePath) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Left Section (Name, Service, City)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  personName,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1,
                    color: Color(0xFF007083),
                  ),
                ),

                const SizedBox(height: 6),

                // Service Row
                Row(
                  children: [
                    const Text(
                      "Service ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1,
                        color: Color(0xFF757575),
                      ),
                    ),
                    Text(
                      serviceName,
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

                const SizedBox(height: 2),

                // City Row
                Row(
                  children: [
                    const Text(
                      "City ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1,
                        color: Color(0xFF757575),
                      ),
                    ),
                    Text(
                      cityName,
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
          ),

          // Right Section (Duration)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Duration",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  height: 1,
                  color: Color(0xFF757575),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                duration,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  height: 1,
                  color: Color(0xFF007083),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
