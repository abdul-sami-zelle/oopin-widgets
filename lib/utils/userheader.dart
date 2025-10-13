import 'package:flutter/material.dart';

class Userheader extends StatelessWidget {
  final String? heading;
  final String? content;
  final bool? textfield;
  final String? img;
  final TextEditingController? controller;
  const Userheader({
    super.key,
    required this.content,
    this.controller,
    required this.heading,
    required this.textfield,
    required this.img
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Color(0xff007083),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(75),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            
          )
        ]
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 260,
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      heading!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                      
                    Text(
                      content!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                child: Image.asset(img!),
              ),
            ],
          ),
          SizedBox(height: 15),
          textfield == true?
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              border: Border.all(color: const Color(0xFFF0F0F0)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Search icon
                SizedBox(
                  width: 15,
                  height: 15,
                  child: const Icon(
                    Icons.search_rounded,
                    size: 15,
                    color: Color(0xFF757575),
                  ),
                ),
      
                // Text field
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      height: 1.5, // 150%
                      color: Color(0xFF757575),
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Search Service by Name...",
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.5,
                        color: Color(0xFF757575),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ):SizedBox(),
        ],
      ),
    );
  }
}
