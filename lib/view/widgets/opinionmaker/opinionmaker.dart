import 'package:flutter/material.dart';

class Opinionmaker extends StatelessWidget {
  final String? image;
  final String? name;
  final String? location;
  final String? experience;
  final String? description;
  const Opinionmaker({super.key, required this.image,required this.name,required this.location, required this.experience,required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
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
            child: SizedBox(
              height: 100,
              child: Image.asset(image!),
            ),
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
                    color: Color(0xff007083),
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
                    color: Color(0xff757575),
                  ),
                ),
                Text(
                  experience!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xff757575),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xff757575),
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
