import 'dart:ui';
import 'package:flutter/material.dart';

class SelectableServices extends StatefulWidget {
  const SelectableServices({super.key});

  @override
  State<SelectableServices> createState() => _SelectableServicesState();
}

class _SelectableServicesState extends State<SelectableServices> {
  int selectedIndex = 0;

  final List<Map<String, String>> services = [
    {"name": "Cars", "image": "assets/img/cars.png"},
    {"name": "Food", "image": "assets/img/food.png"},
    {"name": "Careers", "image": "assets/img/careers.png"},
    {"name": "Travel", "image": "assets/img/travel.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          final service = services[index];

          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 110,
              // height: 110,
              decoration: BoxDecoration(
                // color: const Color(0xFF007083),
                image: DecorationImage(
                  image: AssetImage(service["image"]!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color:
                      isSelected ? const Color(0xFF007083) : Colors.transparent,
                  width: isSelected ? 3 : 0,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          service["name"]!,
                          style: const TextStyle(
                            fontFamily: 'PoetsenOne',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // child: Container(
              //   decoration: BoxDecoration(
              //     // borderRadius: BorderRadius.circular(5),
              //     // image: DecorationImage(
              //     //   image: AssetImage(service["image"]!),
              //     //   fit: BoxFit.cover,
              //     // ),
              //   ),
              //   child:
              // ),
            ),
          );
        },
      ),
    );
  }
}
