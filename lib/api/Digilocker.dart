import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fintech_app/localStorage/LocalStorage.dart';

class Digilocker {
  static Future<Map<String, String>?> createUrl() async {
    // print(".............Inside createUrl Fn........");
    try {
      final accessToken = await LocalStorage.fetchData("id");
      final userId = await LocalStorage.fetchData("userId");

      final url =
          Uri.parse("https://signzy.tech/api/v2/patrons/${userId}/digilockers");

      final header = {
        "Content-Type": "application/json",
        "Authorization": accessToken!,
      };

      final body = jsonEncode({
        "task": "url",
        "essentials": {"redirectUrl": "", "redirectTime": "", "callbackUrl": ""}
      });

      final response = await http.post(url, headers: header, body: body);

      final statusCode = await response.statusCode;

      print(statusCode);
      if (statusCode != 200) return null;

      final data = jsonDecode(response.body);
      // print(data);

      final digilockerUrl = data["result"]["url"].toString();
      final requestId = data["result"]["requestId"].toString();

      Map<String, String> reqData = {
        "digilockerUrl": digilockerUrl,
        "requestId": requestId
      };

      return reqData;
    } catch (e) {
      print("Inside catch block of createUrl Fn");
      print(e.toString());
    }
    return null;
  }

  static Future<int> fetchAadharDetails(String requestId) async {
    // print("****************Inside fetchAadhar Function***************");
    // print(
    //     "*************value of requestId is ${requestId} inside fetchAadharDetails***************");
    try {
      final accessToken = await LocalStorage.fetchData("id");
      final userId = await LocalStorage.fetchData("userId");

      final header = {
        "Content-Type": "application/json",
        "Authorization": accessToken!,
      };

      final body = jsonEncode({
        "task": "getEadhaar",
        "essentials": {"requestId": requestId}
      });

      final url =
          Uri.parse("https://signzy.tech/api/v2/patrons/${userId}/digilockers");

      final response = await http.post(url, headers: header, body: body);
      final statusCode = await response.statusCode;
      print("statusCode is : ${statusCode}");

      final data = jsonDecode(response.body);
      print("data is : ${data}");

      if (statusCode != 200) return statusCode;

      // print(data);

      return statusCode;
    } catch (e) {
      print("Inside catch block of fetchAadharDetails Fn");
      print(e.toString());
    }

    return 400;
  }
}
