import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
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
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
            SizedBox(height: 16),
            Text('Username'),
            SizedBox(height: 8),
            Text('Your personal captioning app'),
            SizedBox(height: 16),
            Text('Settings:'),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Language'),
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
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Default Style'),
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
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('API Usage'),
                Text('$_apiUsage/100 Captions'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){
  // Implement subscription/upgrade functionality
},
child: Text('Subscription Options'),
),
SizedBox(height: 16),
ElevatedButton(
  onPressed: () {
    // Implement logout functionality
  },
  child: Text('Logout'),
),
],
),
),
);
}
}