import 'package:flutter/material.dart';

class Pageheader extends StatelessWidget {
  final String? pagename;
  final bool? ismain;
  const Pageheader({super.key, required this.pagename, required this.ismain});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                child: Image.asset(
                  ismain == true
                      ? 'assets/img/drawer.png'
                      : 'assets/img/back.png',
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff535353),
                ),
              ),
            ],
          ),

          SizedBox(height: 20, child: Image.asset('assets/img/bell.png')),
        ],
      ),
    );
  }
}
