import 'dart:async';
import 'package:flutter/material.dart';

class OopinImageSlider extends StatefulWidget {
  const OopinImageSlider({super.key});

  @override
  State<OopinImageSlider> createState() => _OopinImageSliderState();
}

class _OopinImageSliderState extends State<OopinImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _images = [
    "assets/img/olympics.png",
    "assets/img/fifa.png",
    "assets/img/nba.png",
  ];

  @override
  void initState() {
    super.initState();
    // Auto-slide every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      // height: 221,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Featured Events",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF007083),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Image slider
          SizedBox(
            height: 170,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  // height: 183,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(_images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),

          // Indicators (3 bars)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_images.length, (index) {
              bool isActive = index == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  color:
                      isActive
                          ? const Color(0xFF007083)
                          : const Color(0xFF99C6CD),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
