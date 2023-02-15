import 'package:fintech_app/screens/LoanOfferWithDisbursalAmoutBreakdown.dart';
import 'package:flutter/material.dart';

enum maritalStatus { Married, Unmarried, Null }

const List<String> educationLevelList = [
  "Engineer",
  "Doctor",
  "Chartered Accountant",
  "Lawyer",
  "Business Man"
];

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  String dropDownValue = "Select max education level";
  maritalStatus _status = maritalStatus.Null;
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
          // padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 500,
                child: Text(
                  "Personal Details",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  value: 0.96,
                  minHeight: 7,
                ),
              ),
              SizedBox(height: 35),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 500,
                child: Text(
                  "Education Level",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: DropdownButton(
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text(dropDownValue,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      items: educationLevelList.map((value) {
                        return DropdownMenuItem(
                            child: Text(value), value: value);
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value!;
                        });
                      }),
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 500,
                child: Text(
                  "Father's Name",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your father's full name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 3)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey, width: 3),
                        )),
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 500,
                child: Text(
                  "Marital Status",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 5),
              Container(
                // decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        SizedBox(width: 5),
                        Radio(
                          groupValue: _status,
                          value: maritalStatus.Married,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                          focusColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                          onChanged: (value) {
                            setState(() {
                              _status = value!;
                            });
                          },
                        ),
                        Text(
                          "Married",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    )),
                    SizedBox(width: 25),
                    Container(
                        child: Row(
                      children: [
                        Radio(
                          groupValue: _status,
                          value: maritalStatus.Unmarried,
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                          focusColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                          onChanged: (value) {
                            setState(() {
                              _status = value!;
                            });
                          },
                        ),
                        Text(
                          "Unmarried",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(height: 160),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 50,
                width: 400,
                child: ElevatedButton(
                  child: Text("Submit", style: TextStyle(fontSize: 20)),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blue[900]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoanOfferWithDisbursalAmountBreakdown()));
                  },
                ),
                // decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 30),
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
