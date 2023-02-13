import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanOffer extends StatefulWidget {
  LoanOffer({super.key});

  @override
  State<LoanOffer> createState() => _LoanOfferState();
}

class _LoanOfferState extends State<LoanOffer> {
  double amount = 500000;
  double interestRate = 14.5;
  double GSTPercent = 18;
  double GST = 2250;
  double processingFee = 12500;
  double sliderValue = 200000;
  double totalDisbursalAmount = 485250;

  final dropDownList = ['A', 'B', 'C', 'D'];

  double calculateInterset() {
    return interestRate * (amount / 100);
  }

  void updateSliderValueAndAmount(double value) {
    setState(() {
      amount = sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final indianRupeesFormat = NumberFormat.currency(
      name: "INR",
      locale: 'en_IN',
      decimalDigits: 0, // change it to get decimal places
      symbol: '₹',
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.question_mark, color: Colors.orange, size: 30),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.cancel, color: Colors.orange, size: 30),
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
                padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(border: Border.all()),
                child: Text("Loan Offer",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w500))),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 40,
            ),
            SizedBox(height: 3),
            Container(
              child: Column(
                children: [
                  Text(
                    "I need a loan of",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(indianRupeesFormat.format(amount),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.all(0),
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Slider(
                      min: 0,
                      max: 500000,
                      value: sliderValue,
                      divisions: 5,
                      // autofocus: true,
                      thumbColor: Colors.white,
                      activeColor: Colors.orange,
                      inactiveColor: Colors.grey,

                      onChanged: updateSliderValueAndAmount,
                      label: "₹ ${sliderValue.round()}",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    // decoration: BoxDecoration(border: Border.all()),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            // decoration: BoxDecoration(border: Border.all()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tenure",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("18",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    Text("months",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: DropdownButton<String>(
                                    elevation: 1,
                                    underline: SizedBox(),
                                    items: dropDownList.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                            color: Colors.grey, thickness: 2, width: 40),
                        Expanded(
                          child: Container(
                            // decoration: BoxDecoration(border: Border.all()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("EMI",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 10),
                                Text(
                                    indianRupeesFormat
                                        .format(calculateInterset()),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: 10),
                                Text("${interestRate}%",
                                    style: TextStyle(fontSize: 18)),
                                SizedBox(height: 10),
                                Text("intersest per annum",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              color: Colors.indigo[100],
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
                          Text("Processing fee",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600])),
                          Text(" - ${indianRupeesFormat.format(processingFee)}",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]))
                        ]),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("GST @ ${GSTPercent}%",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600])),
                          Text(" - ${indianRupeesFormat.format(GST)}",
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
                              color: Color(0XFFf2f2f2),
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
                            Text("Total disbursal amount",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600])),
                            Text(
                                "${indianRupeesFormat.format(totalDisbursalAmount)}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600])),
                          ]),
                    ),
                  ]),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Loan Amount", style: TextStyle(fontSize: 18)),
                        SizedBox(height: 5),
                        Text(indianRupeesFormat.format(totalDisbursalAmount),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        child: Text("Apply for Loan"),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[900]),
                        onPressed: () {},
                      ),
                      // decoration: BoxDecoration(border: Border.all()),
                    ),
                  ]),
            ),
            SizedBox(height: 50),
            Text("A Product of Logiciel Analytics",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 40)
          ],
        ),
      )),
    );
  }
}
