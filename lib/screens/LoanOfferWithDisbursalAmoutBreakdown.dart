import 'package:fintech_app/Constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanOfferWithDisbursalAmountBreakdown extends StatefulWidget {
  const LoanOfferWithDisbursalAmountBreakdown({super.key});

  @override
  State<LoanOfferWithDisbursalAmountBreakdown> createState() =>
      _LoanOfferWithDisbursalAmountBreakdownState();
}

class _LoanOfferWithDisbursalAmountBreakdownState
    extends State<LoanOfferWithDisbursalAmountBreakdown> {
  bool checkStatus = false;
  double amount = 500000;
  double emiAmount = 31075;
  double gstRate = 18;
  double preEMI = 2975;
  double netDisbursalAmount = 482875;
  double interestRate = 14.5;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.indigo;
  }

  @override
  Widget build(BuildContext context) {
    final indianRupeesFormat = NumberFormat.currency(
      name: "INR",
      locale: 'en_IN',
      decimalDigits: 0, // change it to get decimal places
      symbol: '₹ ',
    );
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
                  // decoration: BoxDecoration(border: Border.all()),
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("You've got a Loan of",
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
              Container(
                // decoration: BoxDecoration(border: Border.all()),
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Interst",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            SizedBox(height: 10),
                            Text("${interestRate}% PA",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))
                          ],
                        ),
                      ),
                      Expanded(
                        child: VerticalDivider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("EMI",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            SizedBox(height: 10),
                            Text("${indianRupeesFormat.format(emiAmount)}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))
                          ],
                        ),
                      ),
                      Expanded(
                        child: VerticalDivider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tenure",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            SizedBox(height: 10),
                            Text("18 months",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 70, 15, 20),
            child: Card(
              color: Colors.grey[300],
              child: Container(
                padding: EdgeInsets.all(25),
                width: MediaQuery.of(context).size.width,
                // color: Colors.indigo[200],
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Disbursal amount breakdown",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sanctioned amount",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600])),
                            Text(indianRupeesFormat.format(amount),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]))
                          ]),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Processing fee",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey[600])),
                                Text("(inclusive of GST @ ${gstRate}%)",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600])),
                              ],
                            ),
                            Text(" - ${indianRupeesFormat.format(12500)}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]))
                          ]),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pre EMI",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600])),
                            Text(" - ${indianRupeesFormat.format(preEMI)}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]))
                          ]),
                      SizedBox(height: 15),
                      Row(
                        children: List.generate(20, (index) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: 2,
                                width: 10,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Net disbursal amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[600])),
                              Text(
                                  "${indianRupeesFormat.format(netDisbursalAmount)}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[600])),
                            ]),
                      ),
                    ]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(children: [
              Checkbox(
                  value: checkStatus,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  onChanged: (value) {
                    setState(() {
                      checkStatus = value!;
                    });
                  }),
              Expanded(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "I agree to ",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    TextSpan(
                        text: "Privacy Policy",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                                context: context,
                                builder: ((BuildContext context) => AlertDialog(
                                      title: Text("Privacy Policy"),
                                      content: Text(Constant.privacyPolicy),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: Text('Cancel',
                                              style: TextStyle(
                                                  color: Colors.indigo)),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: Text('OK',
                                              style: TextStyle(
                                                  color: Colors.indigo)),
                                        ),
                                      ],
                                    )));
                          },
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )),
                    TextSpan(
                        text: " of Logiciel Analytics",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ]),
                ),
              ),
            ]),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 50,
            width: 400,
            child: ElevatedButton(
              child:
                  Text("Agree to Loan Offer", style: TextStyle(fontSize: 20)),
              style: TextButton.styleFrom(backgroundColor: Colors.blue[900]),
              onPressed: () {},
            ),
            // decoration: BoxDecoration(border: Border.all()),
          ),
          SizedBox(height: 40),
          Text("A Product of Logiciel Analytics",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 15)
        ])),
      ),
    );
  }
}
