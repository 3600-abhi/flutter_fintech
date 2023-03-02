import 'dart:convert';
import 'package:fintech_app/localStorage/LocalStorage.dart';
import 'package:http/http.dart' as http;

class PanVerification {
  static Future<int> verify(String panNumber) async {
    print("...........inside pan verification api.............");
    try {
      final accessToken = await LocalStorage.fetchData("id");
      final userId = await LocalStorage.fetchData("userId");

      final header = {
        "Content-Type": "application/json",
        "Authorization": accessToken!,
      };

      final body = jsonEncode({
        "task": ["1"],
        "essentials": {"number": panNumber}
      });

      final url =
          Uri.parse("https://signzy.tech/api/v2/patrons/${userId}/panv2");

      final response = await http.post(url, headers: header, body: body);
      print(
          "........Inside PanVerification Class and statusCode is : ${response.statusCode} .............");
      final data = await jsonDecode(response.body);
      print(data);
      return response.statusCode;
    } catch (e) {
      print("Inside catch block of PAN verification");
      print(e);
    }

    return 0;
  }
}
