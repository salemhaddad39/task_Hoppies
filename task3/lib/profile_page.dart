import 'package:flutter/material.dart';
import 'package:task3/summary_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();
  

  List<String> hobbiesList = [];
  
 
  String? selectedHobby;
  
  
  final List<String> availableHobbies = [
    'Reading',
    'Swimming', 
    'Cooking',
    'Gaming',
    'Music',
    'Sports',
    'Drawing',
    'Photography',
    'Dancing',
    'Traveling'
  ];
  
  void addHobby() {
    if (selectedHobby != null && !hobbiesList.contains(selectedHobby!)) {
      setState(() {
        hobbiesList.add(selectedHobby!);
      });
      selectedHobby = null;
    }
  }
  
  void removeHobby(String hobby) {
    setState(() {
      hobbiesList.remove(hobby);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "the user name"),
                controller: userNameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "the user city"),
                controller: userCityController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "the user age"),
                controller: userAgeController,
              ),
              SizedBox(height: 20),
              
          
              DropdownButton<String>(
                hint: Text("Select a hobby"),
                value: selectedHobby,
                isExpanded: true,
                items: availableHobbies.map((String hobby) {
                  return DropdownMenuItem<String>(
                    value: hobby,
                    child: Text(hobby),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedHobby = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              
              ElevatedButton(
                onPressed: addHobby,
                child: Text("Add Hobbies"),
              ),
              SizedBox(height: 20),
              
            
              if (hobbiesList.isNotEmpty)
                Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selected Hobbies:", 
                           style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: hobbiesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("• ${hobbiesList[index]}"),
                                  IconButton(
                                    icon: Icon(Icons.delete, size: 20, color: Colors.red),
                                    onPressed: () => removeHobby(hobbiesList[index]),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  final userName = userNameController.text.trim();
                  final userCity = userCityController.text.trim();
                  final userAge = userAgeController.text.trim();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(
                        Name: userName,
                        City: userCity,
                        Age: userAge,
                        Hobbies: hobbiesList, 
                      ),
                    ),
                  );
                },
                child: Text("save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}