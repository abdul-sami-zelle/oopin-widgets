// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Servicecard extends StatelessWidget {
  final String title;
  final String cities;
  final String imagePath;
  final String persons;

  const Servicecard({
    super.key,
    required this.title,
    required this.cities,
    required this.imagePath,
    required this.persons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 165,
      height: 60,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6962BB).withOpacity(0.2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title: Careers
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      height: 1.25, // line-height equivalent
                      color: Color(0xFF007083),
                    ),
                  ),

                  // Subtitle: 22 Cities 400 Advisors
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cities,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          height: 1.1,
                          color: Color(0xFF7D7D7D),
                        ),
                      ),
                      Text(
                        persons,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          height: 1.1,
                          color: Color(0xFF7D7D7D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 5),

          // Image box
          Container(
            width: 58,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6962BB).withOpacity(0.2),
                  blurRadius: 6,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final String cities;
  final String persons;
  final String imagePath;

  const ServiceItem({
    required this.title,
    required this.cities,
    required this.persons,
    required this.imagePath,
  });
}

class ServiceGrid extends StatelessWidget {
  List<ServiceItem> serviceItems = [
    ServiceItem(
      title: 'Careers',
      imagePath: 'assets/img/london.png',
      cities: '22 Cities',
      persons: '400 Advisors',
    ),
    ServiceItem(
      title: 'Education',
      cities: '22 Cities',
      persons: '400 Advisors',
      imagePath: 'assets/img/london.png',
    ),
    ServiceItem(
      title: 'Health Care',
      cities: '22 Cities',
      persons: '400 Advisors',
      imagePath: 'assets/img/london.png',
    ),
    ServiceItem(
      title: 'Banking',
      cities: '22 Cities',
      persons: '400 Advisors',
      imagePath: 'assets/img/london.png',
    ),
    ServiceItem(
      title: 'Technology',
      cities: '22 Cities',
      persons: '400 Advisors',
      imagePath: 'assets/img/london.png',
    ),
    ServiceItem(
      title: 'Consultancy',
      cities: '22 Cities',
      persons: '400 Advisors',
      imagePath: 'assets/img/london.png',
    ),
    ServiceItem(
      title: 'Marketing',
      cities: '22 Cities',
      persons: '400 Advisors',
      imagePath: 'assets/img/london.png',
    ),
    ServiceItem(
      title: 'Legal Advisor',
      cities: '22 Cities',
      persons: '400 Advisors',
      imagePath: 'assets/img/london.png',
    ),
  ];

  ServiceGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Each card takes about half the screen minus spacing
    final cardWidth = (screenWidth - 30) / 2; // 20px margin on each side

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                serviceItems.map((service) {
                  return SizedBox(
                    width: cardWidth,
                    child: Servicecard(
                      title: service.title,
                      cities: service.cities,
                      imagePath: service.imagePath,
                      persons: service.persons,
                    ),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
