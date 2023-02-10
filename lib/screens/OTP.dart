import 'package:fintech_app/screens/BasicDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dart:async';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String mobileNumber = "9856471235";
  double opacityValue = 0.5;
  int otpTimer = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpTimer >= 1) {
        setState(() {
          otpTimer--;
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

  void handleVerifyButtonClick(String verificationCode) {
    setState(() {
      opacityValue = 1;
    });
    // implement the logic here

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BasicDetails()));
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
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(children: [
              Container(
                child: Text("Phone number verification",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                value: 0.6,
                minHeight: 7,
              ),
              SizedBox(height: 30),
              Text("OTP sent to : ${mobileNumber}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(height: 30),
              OtpTextField(
                autoFocus: true,
                numberOfFields: 4,
                fieldWidth: 50,
                borderColor: Colors.indigo,
                focusedBorderColor: Colors.indigo,
                borderWidth: 2,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  handleVerifyButtonClick(verificationCode);
                }, // end onSubmit
              ),
              SizedBox(height: 30),
              ElevatedButton(
                child: Text("Resend",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                style: TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                onPressed: () {},
              ),
              SizedBox(height: 15),
              Text("in ${otpTimer} sec",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 200),
              Container(
                height: 50,
                width: 400,
                child: Opacity(
                  opacity: opacityValue,
                  child: ElevatedButton(
                    child: Text("Verify Phone Number",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                    onPressed: () {},
                  ),
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 20),
            ])),
      ),
    );
  }
}
