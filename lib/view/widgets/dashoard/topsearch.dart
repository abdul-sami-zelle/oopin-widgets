import 'dart:ui';
import 'package:flutter/material.dart';

class Topsearch extends StatelessWidget {
  final String imagePath;
  final String label;

  const Topsearch({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: const Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 6),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          /// --- Background Image ---
          Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),

          /// --- Bottom Gradient + Blur Overlay ---
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 45,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(5),
              ),
              child: Stack(
                children: [
                  // Gradient background
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color.fromRGBO(0, 0, 0, 0), Colors.black],
                      ),
                    ),
                  ),
                  // Blur effect overlay
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(color: Colors.black.withOpacity(0.25)),
                  ),
                  // Content (label + stars)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Label text
                        Text(
                          label,
                          style: const TextStyle(
                            fontFamily: 'PoetsenOne',
                            fontSize: 15,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),

                        const SizedBox(height: 5),

                        /// Star rating row (static)
                        Row(
                          children: List.generate(
                            5,
                            (index) => Container(
                              width: 15,
                              height: 15,
                              margin: const EdgeInsets.only(right: 2),
                              // decoration: BoxDecoration(
                              //   color: const Color(0xFFFF9531),
                              //   borderRadius: BorderRadius.circular(1),
                              // ),
                              child: const Icon(
                                Icons.star,
                                color: Color(0xFFFF9531),
                                size: 15,
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
          ),
        ],
      ),
    );
  }
}
