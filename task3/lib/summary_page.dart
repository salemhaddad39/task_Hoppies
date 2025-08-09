import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String Name;
  final String City;
  final String Age;
  final List<String> Hobbies;

  SummaryPage({
    required this.Name,
    required this.City,
    required this.Age,
    required this.Hobbies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary Page"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $Name"),
            Text("City: $City"),
            Text("Age: $Age"),
            SizedBox(height: 20),
            
            // عرض الهوايات
            Text(
              "Hobbies:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            
            // التحقق من وجود هوايات
            if (Hobbies.isEmpty)
              Text(
                "No hobbies added",
                style: TextStyle(color: Colors.grey),
              )
            else
              // عرض قائمة الهوايات
              Column(
                children: Hobbies.map((hobby) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text("• $hobby"),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}