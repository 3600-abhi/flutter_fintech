

/*******************************************************

Celebration Screen

********************************************************/


// import 'package:fintech_app/screens/RewardAndCelebration.dart';
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'dart:math';

// class Celebration extends StatefulWidget {
//   const Celebration({super.key});

//   @override
//   State<Celebration> createState() => _CelebrationState();
// }

// class _CelebrationState extends State<Celebration> {
//   String amount = "5,00,000";
//   late ConfettiController confettiController;

//   @override
//   void initState() {
//     super.initState();
//     confettiController = ConfettiController(duration: Duration(seconds: 10));
//     confettiController.play();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     confettiController.dispose();
//   }

//   Path drawStar(Size size) {
//     // Method to convert degree to radians
//     double degToRad(double deg) => deg * (pi / 180.0);

//     const numberOfPoints = 5;
//     final halfWidth = size.width / 2;
//     final externalRadius = halfWidth;
//     final internalRadius = halfWidth / 2.5;
//     final degreesPerStep = degToRad(360 / numberOfPoints);
//     final halfDegreesPerStep = degreesPerStep / 2;
//     final path = Path();
//     final fullAngle = degToRad(360);
//     path.moveTo(size.width, halfWidth);

//     for (double step = 0; step < fullAngle; step += degreesPerStep) {
//       path.lineTo(halfWidth + externalRadius * cos(step),
//           halfWidth + externalRadius * sin(step));
//       path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
//           halfWidth + internalRadius * sin(step + halfDegreesPerStep));
//     }
//     path.close();
//     return path;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.brown),
//         backgroundColor: Colors.grey[50],
//         elevation: 0,
//         // title: Text('Personal Info'),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.question_mark, color: Colors.brown, size: 30),
//               onPressed: () {}),
//           IconButton(
//               icon: Icon(Icons.cancel, color: Colors.brown, size: 30),
//               onPressed: () {}),
//           SizedBox(width: 8),
//         ],
//       ),
//       body: Center(
//         child: Container(
//             padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               ConfettiWidget(
//                 confettiController: confettiController,
//                 blastDirectionality: BlastDirectionality
//                     .explosive, // don't specify a direction, blast randomly
//                 shouldLoop:
//                     true, // start again as soon as the animation is finished
//                 colors: [
//                   Colors.green,
//                   Colors.blue,
//                   Colors.pink,
//                   Colors.orange,
//                   Colors.purple
//                 ], // manually specify the colors to be used
//                 createParticlePath: drawStar,
//                 numberOfParticles: 20,
//                 emissionFrequency: 0.03, // define a custom shape/path.
//               ),
//               Container(
//                 height: 200,
//                 width: 200,
//                 decoration:
//                     BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Icon(Icons.currency_rupee, color: Colors.white, size: 35),
//                   Text(amount,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold))
//                 ]),
//               ),
//               SizedBox(height: 100),
//               Container(
//                 height: 50,
//                 width: 400,
//                 child: ElevatedButton(
//                   child: Text("Fake Button", style: TextStyle(fontSize: 20)),
//                   style:
//                       TextButton.styleFrom(backgroundColor: Colors.blue[900]),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => RewardAndCelebration()));
//                   },
//                 ),
//                 // decoration: BoxDecoration(border: Border.all()),
//               ),
//               SizedBox(height: 20),
//             ])),
//       ),
//     );
//   }
// }
