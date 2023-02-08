import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

class FetchCreditReport extends StatefulWidget {
  const FetchCreditReport({super.key});

  @override
  State<FetchCreditReport> createState() => _FetchCreditReportState();
}

class _FetchCreditReportState extends State<FetchCreditReport> {
  double percentProgress = 1.0;
  int timeLeftInSecond = 90;
  String timeLeftString = "01:30";
  late Timer _timer;

  String formatDuration(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final minutes = duration.inMinutes;
    final seconds = totalSeconds % 60;

    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeftInSecond >= 1) {
        timeLeftInSecond--;
        setState(() {
          percentProgress = timeLeftInSecond / 90;
          timeLeftString = formatDuration(timeLeftInSecond);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.brown),
        backgroundColor: Colors.amber[50],
        elevation: 0,
        // title: Text('Personal Info'),
        actions: [
          IconButton(
              icon: Icon(Icons.question_mark, color: Colors.brown, size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.cancel, color: Colors.brown, size: 30),
              onPressed: () {}),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(children: [
              Container(
                width: 500,
                child: Text("Fetching Credit Report",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              ),
              SizedBox(height: 50),
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
              Text("Getting credit information from CIBIL",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))
            ])),
      ),
    );
  }
}
