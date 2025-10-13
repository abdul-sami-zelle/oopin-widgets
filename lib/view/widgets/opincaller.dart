import 'package:flutter/material.dart';

class Opincaller extends StatelessWidget {
  final String? image;
  final String? name;
  final String? location;
  final String? age;
  const Opincaller({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xff007083),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 6,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(height: 50, child: Image.asset(image!)),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                    fontFamily: 'PoetsenOne',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  location!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Text(
                  age!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 5),
                // Text(
                //   description!,
                //   style: TextStyle(
                //     fontFamily: 'Poppins',
                //     fontSize: 10,
                //     fontWeight: FontWeight.w400,
                //     height: 1,
                //     color: Color(0xff757575),
                //   ),
                //   maxLines: 4,
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          ),
          Container(
            width: 80,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xff007083),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20, child: Image.asset('assets/img/call.png')),
                Text(
                  'Call Now',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Color(0xffFFFFFF),
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
