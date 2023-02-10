import 'dart:async';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math';

class RewardAndCelebration extends StatefulWidget {
  const RewardAndCelebration({super.key});

  @override
  State<RewardAndCelebration> createState() => _RewardAndCelebrationState();
}

class _RewardAndCelebrationState extends State<RewardAndCelebration> {
  double percentProgress = 1.0;
  int timeLeftInSecond = 60;
  String timeLeftString = "01:00";
  late Timer _timer;
  bool isLoaded = false;
  String amount = "5,00,000";
  late ConfettiController confettiController;

  String formatDuration(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final minutes = duration.inMinutes;
    final seconds = totalSeconds % 60;

    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeftInSecond >= 1) {
        timeLeftInSecond--;
        setState(() {
          percentProgress = timeLeftInSecond / 60;
          timeLeftString = formatDuration(timeLeftInSecond);
        });
      } else {
        timer.cancel();
      }
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoaded = true;
      });
    });

    confettiController = ConfettiController(duration: Duration(seconds: 10));
    confettiController.play();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        // title: Text('Personal Info'),
        actions: [
          IconButton(
              icon: Icon(Icons.question_mark, color: Colors.grey, size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.cancel, color: Colors.grey, size: 30),
              onPressed: () {}),
          SizedBox(width: 8),
        ],
      ),
      body: AnimatedCrossFade(
        duration: Duration(milliseconds: 400),
        crossFadeState:
            !isLoaded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
              child: Column(children: [
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 10.0,
                  percent: percentProgress,
                  center: Text("${timeLeftString}",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  progressColor: Colors.orange,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 30),
                Text("Please do not close, go back or exit application",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text("Analysing your bank statement",
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),
              ])),
        ),
        secondChild: Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConfettiWidget(
                      confettiController: confettiController,
                      blastDirectionality: BlastDirectionality
                          .explosive, // don't specify a direction, blast randomly
                      shouldLoop:
                          true, // start again as soon as the animation is finished
                      colors: [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ], // manually specify the colors to be used
                      createParticlePath: drawStar,
                      numberOfParticles: 20,
                      emissionFrequency: 0.03, // define a custom shape/path.
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.currency_rupee,
                                color: Colors.white, size: 35),
                            Text(amount,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    SizedBox(height: 100),
                    Container(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                        child:
                            Text("Fake Button", style: TextStyle(fontSize: 20)),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[900]),
                        onPressed: () {},
                      ),
                      // decoration: BoxDecoration(border: Border.all()),
                    ),
                    SizedBox(height: 20),
                  ])),
        ),
      ),
    );
  }
}
