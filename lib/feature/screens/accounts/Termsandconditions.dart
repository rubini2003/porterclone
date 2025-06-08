import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Terms and Conditions'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[50], // Light grey background
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Change the background color here
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Soft shadow color
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Terms and Conditions',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        // Handle Terms and Conditions tap
                        print('Terms and Conditions tapped');
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        // Handle Privacy Policy tap
                        print('Privacy Policy tapped');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
