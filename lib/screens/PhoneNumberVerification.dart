import 'package:fintech_app/api/APILogin.dart';
import 'package:fintech_app/screens/OTP.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberVerification extends StatefulWidget {
  const PhoneNumberVerification({super.key});

  @override
  State<PhoneNumberVerification> createState() =>
      _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {
  String mobileNumber = "";
  void handleSubmitButtonClick() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OTP(mobileNumber: mobileNumber)));
  }

  Future<void> callAPILogin() async {
    await APILogin.Login();
  }

  @override
  void initState() {
    callAPILogin();
    super.initState();
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
              Container(
                width: 500,
                child: Text("Your Mobile Number",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 30),
              IntlPhoneField(
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                  // labelText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.indigo, width: 3)),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  mobileNumber = phone.number;
                  print("My mobile number is : ${mobileNumber}");
                },
              ),
              SizedBox(height: 250),
              Container(
                height: 50,
                width: 400,
                child: ElevatedButton(
                  child: Text("Send OTP", style: TextStyle(fontSize: 20)),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                  onPressed: handleSubmitButtonClick,
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 50),
              Text("A Product of Logiciel Analytics",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
            ])),
      ),
    );
  }
}
