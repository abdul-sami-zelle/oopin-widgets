import 'package:flutter/material.dart';

class FeaturedcityCard extends StatelessWidget {
  final String? cityname;
  final String? imagepath;
  const FeaturedcityCard({
    super.key,
    required this.cityname,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(imagepath!),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(105, 98, 187, 0.2),
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          cityname!,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            height: 1.25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
