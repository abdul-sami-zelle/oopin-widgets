import 'package:flutter/material.dart';

class CityGridLayout extends StatelessWidget {
  const CityGridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First column
          Expanded(
            child: Column(
              children: [
                Citybox(
                  title: 'London',
                  image: 'assets/img/london.png',
                  height: 145,
                ),
                const SizedBox(height: 10),
                Citybox(
                  title: 'Cambridge',
                  image: 'assets/img/cambridge.png',
                  height: 300,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Second column
          Expanded(
            child: Column(
              children: [
                Citybox(
                  title: 'Blackburn',
                  image: 'assets/img/blackburn.png',
                  height: 145,
                ),
                const SizedBox(height: 10),
                Citybox(
                  title: 'Oxford',
                  image: 'assets/img/oxford.png',
                  height: 145,
                ),
                const SizedBox(height: 10),
                Citybox(
                  title: 'Manchester',
                  image: 'assets/img/manchester.png',
                  height: 145,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Citybox extends StatelessWidget {
  final String? title;
  final String? image;
  final double? height;
  const Citybox({
    super.key,
    required this.title,
    required this.image,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6),
        ],
        image: DecorationImage(
          image: AssetImage(image!), // your image path
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

          // Top-left badge ("Selected")
          Positioned(
            bottom: 0,
            child: Container(
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
                // backdropFilter: Blur is not directly supported in BoxDecoration
              ),
              child: Center(
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PoetsenOne',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
