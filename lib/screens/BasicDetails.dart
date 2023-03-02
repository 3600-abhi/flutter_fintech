import 'dart:async';
import 'package:fintech_app/api/PanVerification.dart';
import 'package:fintech_app/localStorage/LocalStorage.dart';
import 'package:fintech_app/screens/FetchCreditReport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum Gender { Male, Female, Other, Null }

class BasicDetails extends StatefulWidget {
  const BasicDetails({super.key});

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  Gender _gender = Gender.Null;
  TextEditingController panController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  bool isLoading = false;
  bool verificationStatus = true;
  bool showVerificationWidget = false;
  double mainScreenOpacity = 1;

  Widget PanVerified() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.2),
      child: Column(children: [
        Icon(Icons.verified, color: Colors.green, size: 48),
        Text("PAN verified Successfully",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ]),
    );
  }

  Widget PanNotVerified() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.3),
      child: Column(children: [
        Icon(Icons.close, color: Colors.red, size: 48),
        Text("Unable to verify",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ]),
    );
  }

  void handleNextButtonClick() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FetchCreditReport()));
  }

  Future<void> handleAutoFill() async {
    print("......inside basic detail AutoFill.....");
    print(await LocalStorage.fetchData("dob"));
    print(await LocalStorage.fetchData("pincode"));
    dobController.text = (await LocalStorage.fetchData("dob"))!;
    pincodeController.text = (await LocalStorage.fetchData("pincode"))!;
  }

  @override
  void initState() {
    handleAutoFill();
    super.initState();
  }

  Future<void> listenPanNumber(String panNumber) async {
    if (panNumber.length == 10) {
      setState(() {
        isLoading = true;
        mainScreenOpacity = 0.2;
      });

      final status = await PanVerification.verify(panNumber);
      print("........Inside listenPanNumber fn and status is : ${status}");

      if (status == 200) {
        setState(() {
          isLoading = false;
          verificationStatus = true;
          showVerificationWidget = true;
        });
      } else {
        setState(() {
          isLoading = false;
          verificationStatus = false;
          showVerificationWidget = true;
        });
      }

      Timer(Duration(seconds: 2), () {
        setState(() {
          showVerificationWidget = false;
          mainScreenOpacity = 1;
        });
      });
    }
  }

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
                  // padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 500,
                  child: Text("Basic Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    value: 0.8,
                    minHeight: 7,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 500,
                  child: Text("Your PAN Number",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your PAN number",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 3)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey, width: 3),
                        )),
                    style: TextStyle(fontWeight: FontWeight.w500),
                    onChanged: listenPanNumber,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 500,
                  child: Text("Your Date of Birth",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    controller: dobController,
                    decoration: InputDecoration(
                        hintText: "Enter your Date of Birth",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 3)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey, width: 3),
                        )),
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 500,
                  child: Text("Gender",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Radio(
                      value: Gender.Male,
                      groupValue: _gender,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      focusColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text("Male",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5),
                    Radio(
                      value: Gender.Female,
                      groupValue: _gender,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      focusColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text("Female",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Radio(
                      value: Gender.Other,
                      groupValue: _gender,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      focusColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text("Other",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 500,
                  child: Text("Pincode (as per KYC records)",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    controller: pincodeController,
                    decoration: InputDecoration(
                        hintText: "Enter Pincode as per KYC records",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 3)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey, width: 3),
                        )),
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    child: Text("Next", style: TextStyle(fontSize: 20)),
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                    onPressed: handleNextButtonClick,
                  ),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
                SizedBox(height: 20),
              ])),
            ),
            Visibility(
              visible: isLoading,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SpinKitWave(
                    color: Colors.indigo,
                    size: 35,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showVerificationWidget,
              child: verificationStatus ? PanVerified() : PanNotVerified(),
            )
          ],
        ),
      ),
    );
  }
}
