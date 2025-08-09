import 'package:flutter/material.dart';
import 'package:task3/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>ProfilePage()),
            );
          },
          child: Text("go to profile page"),
        ),
      ),
    );
  }
}
