import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController =
      TextEditingController(text: 'Rubini');
  final TextEditingController _lastNameController =
      TextEditingController(text: 'Dharmarajan');
  final TextEditingController _emailController =
      TextEditingController(text: 'rubinidharmarajan@gmail.com');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile'), // Added a title
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black, //Ensured text color is black
        actions: [
          TextButton(
            onPressed: () {
              // Handle save action here
              String firstName = _firstNameController.text;
              String lastName = _lastNameController.text;
              String email = _emailController.text;

              print(
                  'Saving: First Name - $firstName, Last Name - $lastName, Email - $email');
              // Perform save operation here (e.g., send to backend)
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.blue, // Customize color as needed
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile number',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '7358177393 Cannot be changed.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTextField('First Name', _firstNameController),
                    _buildTextField('Last Name', _lastNameController),
                    _buildTextField('Email', _emailController),
                    SizedBox(height: 16.0),
                    Text(
                      'GST Details',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                      value: 'Not available',
                      items: [
                        DropdownMenuItem(
                          value: 'Not available',
                          child: Text('Not available'),
                        ),
                        DropdownMenuItem(
                          value: 'available',
                          child: Text('available'),
                        ),
                      ],
                      onChanged: (value) {
                        // Handle GST selection change
                        print('Selected GST: $value');
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
