import 'package:fintech_app/screens/PersonalDetails.dart';
import 'package:flutter/material.dart';

List<String> loanReasonsList = [
  "Education",
  "Medical",
  "Travel",
  "Marriage",
];

class LoanDetails extends StatefulWidget {
  const LoanDetails({super.key});

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  String dropDownValue = "Select loan Reason";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.grey[50],
        elevation: 0,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                child: Text(
                  "Loan Details",
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
                value: 0.6,
                minHeight: 7,
              ),
              SizedBox(height: 35),
              Container(
                child: Text("Loan Reason",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                child: DropdownButton(
                  underline: SizedBox(),
                  // alignment: Alignment.center,
                  isExpanded: true,
                  items: loanReasonsList.map((value) {
                    return DropdownMenuItem(child: Text(value), value: value);
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                  },
                  // value: dropDownValue,
                  hint: Text(dropDownValue,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 350),
              Container(
                height: 50,
                width: 400,
                child: ElevatedButton(
                  child: Text("Next", style: TextStyle(fontSize: 20)),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetails()));
                  },
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: Text("A Product of Logiciel Analytics",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
