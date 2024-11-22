import 'package:caption_it/home_page.dart';
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        title: const Text('P R O F I L E'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile_image.png'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Suraj Yadav',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            const Text('Your personal captioning app'),
            const SizedBox(height: 16),
            const Text(
              'Settings:',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Language'),
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Default Style'),
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('API Usage'),
                Text('$_apiUsage/100 Captions'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.teal),
              ),
              onPressed: () {
                // Implement subscription/upgrade functionality
              },
              child: const Text('Subscription Options',style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.teal),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/onboarding');
              },
              child: const Text('Logout',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
