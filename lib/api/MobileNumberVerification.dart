import 'dart:convert';
import 'package:fintech_app/localStorage/LocalStorage.dart';
import 'package:http/http.dart' as http;

class MobileNumberVerification {
  static Future<Map<dynamic, dynamic>?> sendOTP(String mobileNumber) async {
    print(".......inside send OTP fn........");
    try {
      final accessToken = await LocalStorage.fetchData("id");
      final userId = await LocalStorage.fetchData("userId");

      var url =
          Uri.parse("https://signzy.tech/api/v2/patrons/${userId}/phones");
      var body = jsonEncode({
        "task": "mobile",
        "essentials": {
          "task": "generateOtp",
          "countryCode": "91",
          "mobileNumber": mobileNumber
        }
      });

      final header = {
        "Content-Type": "application/json",
        "Authorization": accessToken!,
      };
      final response = await http.post(url, body: body, headers: header);
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print("Inside catch block");
      print(e);
    }

    return null;
  }

  static Future<int> verifyOTP(
      String otp, String referenceId, String mobileNumber) async {
    print("..............inside verify otp function........");
    try {
      final accessToken = await LocalStorage.fetchData("id");
      final userId = await LocalStorage.fetchData("userId");
      var url = Uri.parse(
          "https://signzy.tech/api/v2/patrons/${userId}/phones");

      var body = jsonEncode({
        "task": "mobile",
        "essentials": {
          "task": "submitOtp",
          "countryCode": "91",
          "mobileNumber": mobileNumber,
          "referenceId": referenceId,
          "otp": otp
        }
      });

      final header = {
        "Content-Type": "application/json",
        "Authorization": accessToken!,
      };
      final response = await http.post(url, body: body, headers: header);
      print(response.statusCode);

      if (response.statusCode != 200) return response.statusCode;

      final data = jsonDecode(response.body);
      print(data);

      final name = data["result"]["name"].toString();
      final email = data["result"]["email"].toString();
      final dob = data["result"]["dob"].toString();
      final pincode = data["result"]["splitAddress"]["pincode"].toString();
      await LocalStorage.saveData("name", name);
      await LocalStorage.saveData("email", email);
      await LocalStorage.saveData("dob", dob);
      await LocalStorage.saveData("pincode", pincode);

      return response.statusCode;
    } catch (e) {
      print("Inside catch block");
      print(e);
    }

    return 0;
  }
}
