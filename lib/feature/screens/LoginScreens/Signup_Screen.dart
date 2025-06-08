import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/LoginScreens/OtpScreen.dart';

class RegistrationScreen extends StatefulWidget {
  final String mobileNumber;
  const RegistrationScreen({Key? key, required this.mobileNumber})
      : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(26.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 500,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "PORTER°",
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/india_flag.png', // Replace with your image path
                  //   width: 24.0,
                  //   height: 24.0,
                  // ),
                  SizedBox(width: 8.0),
                  Text(
                    '${widget.mobileNumber}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'CHANGE',
                      style: TextStyle(color: Colors.blue[700]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Firstname',
                        labelStyle: TextStyle(
                            color: Colors.grey), // Set label text color to grey
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Lastname',
                        labelStyle: TextStyle(
                            color: Colors.grey), // Set label text color to grey
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  labelStyle: TextStyle(
                      color: Colors.grey), // Set label text color to grey
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 40.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Requirement',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                    borderSide: BorderSide(color: Colors.grey), // Border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: Colors.grey), // Default border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1), // Highlighted border color
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 16), // Adjust padding
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Business Usage',
                    child: Text('Business Usage'),
                  ),
                  DropdownMenuItem(
                    value: 'Personal Usage',
                    child: Text('Personal Usage'),
                  ),
                  DropdownMenuItem(
                    value: 'House Shifting Usage',
                    child: Text('House Shifting Usage'),
                  ),
                ],
                onChanged: (value) {},
                hint: Text("I will be using Porter for :"),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Have referral code ?',
                  style: TextStyle(color: Colors.blue[700]),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationPage(
                          mobileNumber: widget.mobileNumber),
                    ),
                  );
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.6, // Adjust this value to make it smaller
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      activeColor: Colors.blue[700],
                      checkColor: Colors.white,
                    ),
                  ),
                  // Checkbox(
                  //   value: isChecked,
                  //   onChanged: (bool? value) {
                  //     setState(() {
                  //       isChecked = value ?? false; // Handle null safety
                  //     });
                  //   },
                  //   activeColor: Colors.blue[700],
                  //   checkColor: Colors.white,
                  // ),
                  Text(
                    'Allow Porter to send updates on',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 4.0),
                  Image.asset(
                    'assets/image/whatsapp.png', // Replace with your whatsapp icon path
                    width: 20.0,
                    height: 20.0,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    'WhatsApp',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'A one time password (OTP) will be sent to this number for verification',
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign
                      .center, // Ensures the text is centered inside the widget
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
