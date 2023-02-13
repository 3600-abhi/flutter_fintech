import 'package:fintech_app/screens/SelectBank.dart';
import 'package:flutter/material.dart';

class UploadBankStatement extends StatelessWidget {
  const UploadBankStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange[300]),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        // title: Text('Personal Info'),
        actions: [
          IconButton(
              icon: Icon(Icons.question_mark, color: Colors.orange[300], size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.cancel, color: Colors.orange[300], size: 30),
              onPressed: () {}),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/bankstatement.png',
                    width: 200, height: 200),
              ),
              SizedBox(height: 50),
              Container(
                width: 500,
                child: Text("Please upload your bank statement",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              ),
              SizedBox(height: 25),
              Container(
                width: 500,
                child: Text(
                  "Increase your eligible loan amount by uploading your bank statements upto six months. Your bank statement will be used to calculate your revised eligibility",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 100),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 50,
                  width: 80,
                  child: ElevatedButton(
                    child: Text("Next", style: TextStyle(fontSize: 18)),
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectBank()));
                    },
                  ),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
              ),
            ])),
      ),
    );
  }
}
