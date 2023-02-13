import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String name = "Abhishek Jaiswal";
  String gender = "Male";
  String email = "abhishekjaiswal@gmail.com";
  String phoneNumber = "8545698523";
  String panNumber = "BHJPJ4565AB";

  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                        height: 100,
                        child: Container(color: Colors.indigo[900])),
                    SizedBox(height: 80),
                    Container(
                      child: Text(name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Text(gender,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18)),
                    ),
                    SizedBox(height: 35),
                    ListTile(
                      leading: Icon(Icons.email_rounded),
                      title: Text("Email Address"),
                      subtitle: Text(email),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Phone Number"),
                      subtitle: Text(phoneNumber),
                    ),
                    ListTile(
                      leading: Icon(Icons.card_membership),
                      title: Text("PAN Number"),
                      subtitle: Text(panNumber),
                    ),
                    SizedBox(height: 151),
                    Text("A Product of Logiciel Analytics",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20)
                  ],
                ),
              ),
              Positioned(
                  top: 30,
                  left: MediaQuery.of(context).size.width / 3,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 65,
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.grey[900],
                      )))
            ],
          ),
        ));
  }
}
