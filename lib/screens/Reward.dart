

/*******************************************************

Reward Screen

********************************************************/

// import 'dart:async';
// import 'package:fintech_app/screens/Celebration.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class Reward extends StatefulWidget {
//   const Reward({super.key});

//   @override
//   State<Reward> createState() => _RewardState();
// }

// class _RewardState extends State<Reward> {
//   double percentProgress = 1.0;
//   int timeLeftInSecond = 60;
//   String timeLeftString = "01:00";
//   late Timer _timer;

//   String formatDuration(int totalSeconds) {
//     final duration = Duration(seconds: totalSeconds);
//     final minutes = duration.inMinutes;
//     final seconds = totalSeconds % 60;

//     final minutesString = '$minutes'.padLeft(2, '0');
//     final secondsString = '$seconds'.padLeft(2, '0');
//     return '$minutesString:$secondsString';
//   }

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (timeLeftInSecond >= 1) {
//         timeLeftInSecond--;
//         setState(() {
//           percentProgress = timeLeftInSecond / 60;
//           timeLeftString = formatDuration(timeLeftInSecond);
//         });
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _timer.cancel();
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
//       body: SingleChildScrollView(
//         child: Container(
//             padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
//             child: Column(children: [
//               CircularPercentIndicator(
//                 radius: 80.0,
//                 lineWidth: 10.0,
//                 percent: percentProgress,
//                 center: Text("${timeLeftString}",
//                     style: TextStyle(
//                         color: Colors.orange,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold)),
//                 progressColor: Colors.orange,
//                 backgroundColor: Colors.grey,
//               ),
//               SizedBox(height: 30),
//               Text("Please do not close, go back or exit application",
//                   style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold)),
//               SizedBox(height: 150),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.analytics_outlined,
//                     color: Colors.blue,
//                   ),
//                   SizedBox(width: 10),
//                   Text("Analysing your bank statement",
//                       style: TextStyle(fontSize: 18)),
//                 ],
//               ),
//               SizedBox(height: 80),
//               Container(
//                 height: 50,
//                 width: 400,
//                 child: ElevatedButton(
//                   child: Text("Fake Button", style: TextStyle(fontSize: 20)),
//                   style:
//                       TextButton.styleFrom(backgroundColor: Colors.blue[900]),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Celebration()));
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
