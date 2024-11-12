import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _language = 'English';
  String _defaultStyle = 'Funny';
  int _apiUsage = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         const   CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
          const  SizedBox(height: 16),
          const  Text('Username'),
          const  SizedBox(height: 8),
          const  Text('Your personal captioning app'),
          const  SizedBox(height: 16),
          const  Text('Settings:'),
          const  SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
           const     Text('Language'),
                DropdownButton<String>(
                  value: _language,
                  items: ['English', 'Spanish', 'French']
                      .map((lang) => DropdownMenuItem<String>(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                ),
              ],
            ),
          const  SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             const   Text('Default Style'),
                DropdownButton<String>(
                  value: _defaultStyle,
                  items: ['Funny', 'Inspirational', 'Poetic', 'Romantic']
                      .map((style) => DropdownMenuItem<String>(
                            value: style,
                            child: Text(style),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _defaultStyle = value!;
                    });
                  },
                ),
              ],
            ),
          const  SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             const   Text('API Usage'),
                Text('$_apiUsage/100 Captions'),
              ],
            ),
           const SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){
  // Implement subscription/upgrade functionality
},
child: const Text('Subscription Options'),
),
const SizedBox(height: 16),
ElevatedButton(
  onPressed: () {
    // Implement logout functionality
  },
  child: const Text('Logout'),
),
],
),
),
);
}
}