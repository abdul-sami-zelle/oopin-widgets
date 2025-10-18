import 'package:flutter/material.dart';

// class CustomStepper extends StatefulWidget {
//   const CustomStepper({super.key});

//   @override
//   State<CustomStepper> createState() => _CustomStepperState();
// }

// class _CustomStepperState extends State<CustomStepper> {
//   int currentStep = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 340,
//       // height: 140,
//       margin: const EdgeInsets.all(10),
//       padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 20),
//       decoration: BoxDecoration(
//         color: const Color(0xFF007083),
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: const [
//           BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4)),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Title
//           Row(
//             children: [
//               SizedBox(width: 10,),
//               Container(
//                 width: 30,
//                 height: 30,
//                 padding: EdgeInsets.all(5),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child: Image.asset('assets/img/arrowback.png'),
//                   // child: Icon(Icons.person, color: Color(0xFF007083), size: 18),
//                 ),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 'User Account',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w500,
//                   fontSize: 15,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),

//           // Left Icon Circle

//           // 👇 Wrapped Stepper Section
//           Container(
//             // width: 320,
//             height: 70,
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               // borderRadius: BorderRadius.circular(10),
//               // border: Border.all(
//               //   color: Colors.white.withOpacity(0.3),
//               //   width: 1.5,
//               // ),
//             ),
//             child: Stack(
//               children: [
//                 // Connector lines
//                 Positioned(
//                   left: 20,
//                   top: 30.5,
//                   child: Container(width: 130, height: 2, color: Colors.white),
//                 ),
//                 Positioned(
//                   left: 150,
//                   top: 30.5,
//                   child: Container(width: 130, height: 2, color: Colors.white),
//                 ),

//                 // Step circles
//                 _buildStepCircle(1, 20, 15),
//                 _buildStepCircle(2, 150, 15),
//                 _buildStepCircle(3, 270, 15),

//                 // Step labels
//                 const Positioned(
//                   left: 10,
//                   top: 52,
//                   child: Text(
//                     'Basic Info',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const Positioned(
//                   left: 130,
//                   top: 52,
//                   child: Text(
//                     'Verification',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const Positioned(
//                   left: 270,
//                   top: 52,
//                   child: Text(
//                     'Review',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStepCircle(int step, double left, double top) {
//     final bool isCompleted = step < currentStep;
//     final bool isActive = step == currentStep;
//     // final bool isUpcoming = step > currentStep;

//     if (isCompleted) {
//       return Positioned(
//         left: left,
//         top: top,
//         child: GestureDetector(
//           onTap: () => setState(() => currentStep = step),
//           child: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white),
//             ),
//             child: const Center(
//               child: Icon(Icons.check, size: 18, color: Color(0xFF007083)),
//             ),
//           ),
//         ),
//       );
//     }

//     if (isActive) {
//       return Positioned(
//         left: left,
//         top: top,
//         child: GestureDetector(
//           onTap: () => setState(() => currentStep = step),
//           child: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//               color: const Color(0xFF007083),
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white),
//             ),
//             child: Center(
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     }

//     // Upcoming: solid teal
//     return Positioned(
//       left: left,
//       top: top,
//       child: GestureDetector(
//         onTap: () => setState(() => currentStep = step),
//         child: Container(
//           width: 30,
//           height: 30,
//           decoration: BoxDecoration(
//             color: const Color(0xFF007083),
//             shape: BoxShape.circle,
//             border: Border.all(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF007083),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset('assets/img/arrowback.png'),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'User Account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Stepper section
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Connector line
                Positioned(
                  top: 20,
                  left: 25,
                  right: 25,
                  child: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                ),

                // Circles + labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStep(1, 'Basic Info'),
                    _buildStep(2, 'Verification'),
                    _buildStep(3, 'Review'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int step, String label) {
    final bool isCompleted = step < currentStep;
    final bool isActive = step == currentStep;

    Color circleColor;
    Widget? innerChild;

    if (isCompleted) {
      circleColor = Colors.white;
      innerChild =
          const Icon(Icons.check, size: 18, color: Color(0xFF007083));
    } else if (isActive) {
      circleColor = const Color(0xFF007083);
      innerChild = Container(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      );
    } else {
      circleColor = const Color(0xFF007083);
      innerChild = null;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => setState(() => currentStep = step),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(child: innerChild),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
