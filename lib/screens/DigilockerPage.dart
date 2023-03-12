import 'dart:async';
import 'package:fintech_app/api/Digilocker.dart';
import 'package:fintech_app/screens/FetchAadharDetails.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DigilockerPage extends StatefulWidget {
  const DigilockerPage({super.key});

  @override
  State<DigilockerPage> createState() => _DigilockerPageState();
}

class _DigilockerPageState extends State<DigilockerPage> {
  late WebViewController controller;
  String? digilockerUrl;
  String? requestId;
  bool isLoaded = false;

  Future<void> handleCreateUrl() async {
    final data = await Digilocker.createUrl();
    print("data recieved is : ${data}");
    if (data == null) return;

    digilockerUrl = data["digilockerUrl"];
    requestId = data["requestId"];

    // print("${digilockerUrl}");
    // print("*************Value of requestId is : ${requestId}**************");

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // print("*********************${request.url}**************");

            if (request.url.startsWith(
                'https://digilocker.signzy.tech/digilocker-auth-complete')) {
              Timer(Duration(seconds: 5
              ), () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FetchAadharDetails(requestId: requestId!)));
              });
              // return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("${digilockerUrl}"));

    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    handleCreateUrl();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Digilocker Account Verification"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Container(
            child: Stack(children: [
          Center(child: SpinKitWave(color: Colors.indigo, size: 35)),
          isLoaded
              ? WebViewWidget(controller: controller)
              : Center(child: SpinKitWave(color: Colors.indigo, size: 35))
        ])));
  }
}
