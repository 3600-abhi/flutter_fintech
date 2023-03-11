import 'dart:async';
import 'package:fintech_app/api/Digilocker.dart';
import 'package:fintech_app/screens/LoanOfferWithDisbursalAmoutBreakdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class FetchAadharDetails extends StatefulWidget {
  String requestId;
  FetchAadharDetails({super.key, required this.requestId});

  @override
  State<FetchAadharDetails> createState() => _FetchAadharDetailsState();
}

class _FetchAadharDetailsState extends State<FetchAadharDetails> {
  bool isAaddharDataFetched = false;
  late int status;

  Widget showLoader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Fetching Aadhar Details...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        SizedBox(height: 20),
        SpinKitWave(color: Colors.indigo, size: 35)
      ],
    );
  }

  Widget showMessage() {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      status == 200
          ? Icon(
              Icons.verified,
              color: Colors.green,
              size: 50,
            )
          : Icon(Icons.close, color: Colors.red, size: 50),
      status == 200
          ? Text("Fetched Successfully",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          : Text("Unable to Fetch",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
    ]));
  }

  Future<void> handleFetchAadharDetails() async {
    status = await Digilocker.fetchAadharDetails(widget.requestId);

    setState(() {
      isAaddharDataFetched = true;
    });

    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoanOfferWithDisbursalAmountBreakdown()));
    });
  }

  @override
  void initState() {
    handleFetchAadharDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Center(child: isAaddharDataFetched ? showMessage() : showLoader()));
  }
}
