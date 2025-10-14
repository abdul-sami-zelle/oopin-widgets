import 'dart:ui';
import 'package:flutter/material.dart';

class Subservices extends StatefulWidget {
  final String title;
  final String image;

  const Subservices({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  State<Subservices> createState() => _SubservicesState();
}

class _SubservicesState extends State<Subservices> {
  bool isSelected = false; // track selection state

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection, // toggle on tap
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6),
          ],
          image: DecorationImage(
            image: AssetImage(widget.image), // your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Overlay gradient (darken the image slightly)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),

            // Top-left badge ("Selected" / "Select")
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                width: 80,
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : const Color(0xFF007083),
                  borderRadius: BorderRadius.circular(10),
                  border: isSelected
                      ? Border.all(color: const Color(0xFF007083))
                      : null,
                ),
                child: Center(
                  child: Text(
                    isSelected ? 'Select' : 'selected',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 9,
                      height: 1,
                      color: isSelected ? const Color(0xFF007083) : Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Bottom title with blur effect
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  Container(
                    width: 165,
                    height: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Container(
                    width: 165,
                    height: 30,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color.fromRGBO(0, 0, 0, 0), Colors.black],
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'PoetsenOne',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1,
                          color: Colors.white,
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
