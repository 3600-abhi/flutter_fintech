import 'package:fintech_app/api/MobileNumberVerification.dart';
import 'package:fintech_app/screens/PersonalInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class OTP extends StatefulWidget {
  String mobileNumber;
  OTP({super.key, required this.mobileNumber});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  int otpTimer = 30;
  late Timer _timer;
  late String referenceId;
  double mainScreenOpacity = 1;
  bool isLoading = false;
  bool wrongOTPWidget = false;

  void callSendOTP() async {
    final data = await MobileNumberVerification.sendOTP(widget.mobileNumber);
    print("Inside callSendOTP fn Bruh !!!");
    referenceId = data!["result"]["referenceId"];
    print("My referenceId is : ${referenceId}");
  }

  @override
  void initState() {
    callSendOTP();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpTimer >= 1) {
        setState(() {
          otpTimer--;
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<void> handleOTPVerification(String otp) async {
    setState(() {
      mainScreenOpacity = 0.2;
      isLoading = true;
    });

    int status = await MobileNumberVerification.verifyOTP(
        otp, referenceId, widget.mobileNumber);

    if (status != 200) {
      setState(() {
        wrongOTPWidget = true;
        isLoading = false;
      });

      Timer(Duration(seconds: 2), () {
        setState(() {
          wrongOTPWidget = false;
          mainScreenOpacity = 1;
        });
      });
    } else {
      setState(() {
        isLoading = false;
        mainScreenOpacity = 1;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PersonalInfo()));
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Mobile Number is : ${widget.mobileNumber}");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange[300]),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        // title: Text('Personal Info'),
        actions: [
          IconButton(
              icon: Icon(Icons.question_mark,
                  color: Colors.orange[300], size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.cancel, color: Colors.orange[300], size: 30),
              onPressed: () {}),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: mainScreenOpacity,
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(children: [
                    Container(
                      child: Text("Phone number verification",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28)),
                    ),
                    SizedBox(height: 20),
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      value: 0.6,
                      minHeight: 7,
                    ),
                    SizedBox(height: 30),
                    Text("OTP sent to : ${widget.mobileNumber}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
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
                        handleOTPVerification(verificationCode);
                      }, // end onSubmit
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      child: Text("Resend",
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[900]),
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    Text("in ${otpTimer} sec",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 200),
                  ])),
            ),
            Visibility(
              visible: isLoading,
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4),
                child: SpinKitWave(color: Colors.indigo, size: 35),
              ),
            ),
            Visibility(
                visible: wrongOTPWidget,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4,
                      left: MediaQuery.of(context).size.width * 0.31),
                  child: Column(children: [
                    Icon(Icons.close, color: Colors.red, size: 48),
                    Text("Wrong OTP",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
