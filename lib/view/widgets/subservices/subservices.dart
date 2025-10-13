import 'package:flutter/material.dart';

class Subservices extends StatelessWidget {
  final String? title;
  final String? image;
  final bool? isSelected;
  const Subservices({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: 100,
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
            top: 5,
            left: 5,
            child:
                isSelected == true
                    ? Container(
                      width: 80,
                      height: 20,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF007083),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'selected',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    : Container(
                      width: 80,
                      height: 20,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF007083))
                      ),
                      child: Center(
                        child: Text(
                          'Select',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            height: 1,
                            color: const Color(0xFF007083),
                          ),
                        ),
                      ),
                    ),
          ),

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
