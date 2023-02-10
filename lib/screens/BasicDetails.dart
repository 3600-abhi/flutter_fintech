import 'package:fintech_app/screens/FetchCreditReport.dart';
import 'package:flutter/material.dart';

enum Gender { Male, Female, Other, Null }

class BasicDetails extends StatefulWidget {
  const BasicDetails({super.key});

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  Gender _gender = Gender.Null;

  void handleNextButtonClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FetchCreditReport()));
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
                width: 500,
                child: Text("Basic Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                value: 0.8,
                minHeight: 7,
              ),
              SizedBox(height: 30),
              Container(
                width: 500,
                child: Text("Your PAN Number",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your PAN number",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.indigo, width: 3)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                    )),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Container(
                width: 500,
                child: Text("Your Date of Birth",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your Date of Birth",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.indigo, width: 3)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                    )),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Container(
                width: 500,
                child: Text("Gender",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Radio(
                    value: Gender.Male,
                    groupValue: _gender,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey),
                    focusColor:
                        MaterialStateColor.resolveWith((states) => Colors.grey),
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text("Male",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: Gender.Female,
                    groupValue: _gender,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey),
                    focusColor:
                        MaterialStateColor.resolveWith((states) => Colors.grey),
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text("Female",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: Gender.Other,
                    groupValue: _gender,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey),
                    focusColor:
                        MaterialStateColor.resolveWith((states) => Colors.grey),
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text("Other",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: 500,
                child: Text("Pincode (as per KYC records)",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Pincode as per KYC records",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.indigo, width: 3)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                    )),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              Container(
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
    );
  }
}
