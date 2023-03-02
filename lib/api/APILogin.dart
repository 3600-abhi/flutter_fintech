import 'dart:convert';
import 'package:fintech_app/localStorage/LocalStorage.dart';
import 'package:http/http.dart' as http;

class APILogin {
  static Future<void> Login() async {
    try {
      final String username = "logastech";
      final String password = "vQ7zSrjuPIYMJ497E6";

      final body = {"username": username, "password": password};

      final url = Uri.parse("https://signzy.tech/api/v2/patrons/login");
      final response = await http.post(url, body: body);
      final data = jsonDecode(response.body);

      print("HeHeHe inside APILogin fn");
      print(data);

      final id = data["id"].toString();
      final ttl = data["ttl"].toString();
      final userId = data["userId"].toString();
      
      print("My Id : ${id}");
      print("My ttl : ${ttl}");
      print("My userId : ${userId}");

      await LocalStorage.saveData("id", id);
      await LocalStorage.saveData("ttl", ttl);
      await LocalStorage.saveData("userId", userId);

    } catch (e) {
      print("Inside catch block");
      print(e);
    }
  }
}
