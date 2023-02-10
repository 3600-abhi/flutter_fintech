import 'package:fintech_app/screens/RewardAndCelebration.dart';
import 'package:flutter/material.dart';

class SelectBank extends StatefulWidget {
  const SelectBank({super.key});

  @override
  State<SelectBank> createState() => _SelectBankState();
}

class _SelectBankState extends State<SelectBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Select Your Bank Screen",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 400,
              child: ElevatedButton(
                child: Text("Fake Button", style: TextStyle(fontSize: 20)),
                style: TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RewardAndCelebration()));
                },
              ),
              // decoration: BoxDecoration(border: Border.all()),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
