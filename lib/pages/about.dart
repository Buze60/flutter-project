import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              "Welcome to Our App!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 10),
            // Subheading
            Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[600],
              ),
            ),
            const SizedBox(height: 10),
            // Card for the main text content
            Card(
              elevation: 5,
              shadowColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "At our app, we aim to provide the best experience to our users. "
                  "We believe in quality, customer satisfaction, and continuous improvement. "
                  "We hope you enjoy using our platform and find it useful in your daily life.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    height: 1.5, // Line height for readability
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Decorative icons (optional)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.flag, color: Colors.blueGrey, size: 40),
                    SizedBox(height: 5),
                    Text('Quality'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.people, color: Colors.blueGrey, size: 40),
                    SizedBox(height: 5),
                    Text('Team'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.star, color: Colors.blueGrey, size: 40),
                    SizedBox(height: 5),
                    Text('Excellence'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Subtle background color
    );
  }
}
