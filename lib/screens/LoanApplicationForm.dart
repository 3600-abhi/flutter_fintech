import 'package:fintech_app/screens/LoanOffer.dart';
import 'package:fintech_app/screens/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanApplicationForm extends StatefulWidget {
  const LoanApplicationForm({super.key});

  @override
  State<LoanApplicationForm> createState() => _LoanApplicationFormState();
}

class _LoanApplicationFormState extends State<LoanApplicationForm> {
  int currIndex = 0;
  int amount = 500000;

  final indianRupeesFormat = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    decimalDigits: 0, // change it to get decimal places
    symbol: '₹ ',
  );

  void handleStepCancel() {
    if (currIndex > 0) {
      setState(() {
        currIndex--;
      });
    }
  }

  void handleStepContinue() {
    if (currIndex < 2) {
      setState(() {
        currIndex++;
      });
    }
  }

  void handleStepTap(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        // title: Text('Personal Info'),
        actions: [
          IconButton(
              icon: Icon(Icons.question_mark, color: Colors.white, size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.person, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              }),
          IconButton(
              icon: Icon(Icons.cancel, color: Colors.white, size: 30),
              onPressed: () {}),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.indigo[900],
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("You are eligible of loan upto",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500))),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                // width: MediaQuery.of(context).size.width,
                child: Text(indianRupeesFormat.format(amount),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("* Subject to policy and document verification",
                      style: TextStyle(color: Colors.white))),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Stepper(
              controlsBuilder: ((context, details) {
                return SizedBox.shrink();
              }),
              currentStep: currIndex,
              onStepCancel: handleStepCancel,
              onStepContinue: handleStepContinue,
              onStepTapped: handleStepTap,
              steps: [
                Step(
                    state:
                        currIndex > 0 ? StepState.complete : StepState.indexed,
                    isActive: currIndex == 0,
                    title: Text("Fill your Loan application"),
                    subtitle: Text("Add reason for loan and family details"),
                    content: Container(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[900]),
                        child: Row(
                          children: [
                            Text("Fill Application Form"),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoanOffer()));
                        },
                      ),
                    )),
                Step(
                    state:
                        currIndex > 1 ? StepState.complete : StepState.indexed,
                    isActive: currIndex == 1,
                    title: Text("Complete your KYC"),
                    subtitle: Text(
                        "Upload Address Proof, PAN Card & verify with Selfie"),
                    content: Container(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[900]),
                        child: Row(
                          children: [
                            Text("Upload Document"),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                        onPressed: () {},
                      ),
                    )),
                Step(
                    state:
                        currIndex > 2 ? StepState.complete : StepState.indexed,
                    isActive: currIndex == 2,
                    title: Text("Accept Loan Offer"),
                    subtitle: Text("Confirm your loan offer and EMI details"),
                    content: Container(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[900]),
                        child: Row(
                          children: [
                            Text("Confirm Loan Offer"),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                        onPressed: () {},
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(height: 170),
          Text("A Product of Logiciel Analytics",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 15)
        ])),
      ),
    );
  }
}
