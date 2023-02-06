import 'package:fintech_app/Constant.dart';
import 'package:fintech_app/screens/PhoneNumberVerification.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool isChecked = false;

  void handlePressCheckbox(bool? value) {
    setState(() {
      isChecked = value!;
    });
  }

  void handleNextButtonClick() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PhoneNumberVerification()));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
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
          child: Column(
            children: [
              Container(
                width: 500,
                child: Text(
                  "Personal Information",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                value: 0.3,
                minHeight: 7,
              ),
              SizedBox(height: 35),
              Container(
                width: 500,
                child: Text(
                  "Your Full Name",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Your Full Name As Per PAN",
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
                child: Text(
                  "Email Address",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 10),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter your Email Address",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.indigo, width: 3)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 3),
                      )),
                  style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    child: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      activeColor: Colors.transparent,
                      value: isChecked,
                      onChanged: handlePressCheckbox,
                    ),
                    // decoration: BoxDecoration(border: Border.all()),
                  ),

                  Flexible(
                      child: Text(Constant.checkBoxMessage,
                          style: TextStyle(fontWeight: FontWeight.w600))),
                  // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                ],
              ),
              SizedBox(height: 70),
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
              SizedBox(height: 50),
              Text("A Product of Logiciel Analytics",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
