import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';
import 'package:porter_clone/feature/screens/LoginScreens/Signup_Screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCountryCode = '+91';
  String _selectedCountryIsoCode = 'IN'; // Initial value for India
  PhoneNumber? _phoneNumber;
  double childSize = 0.34; // Initial height of DraggableScrollableSheet

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void expandSheet() {
    setState(() {
      childSize = 0.75; // Expands to 75% of the screen
    });
  }

  void resetSheet() {
    setState(() {
      childSize = 0.34; // Reset back to initial size
    });
  }

  void _proceedLogin() {
    String fullNumber = _selectedCountryCode + _phoneNumberController.text;
    print("Full Number: $fullNumber");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(mobileNumber: fullNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (childSize > 0.34) {
          resetSheet();
          return false; // Prevents closing the screen
        }
        return true; // Allows closing the screen
      },
      child: GestureDetector(
        onTap: resetSheet, // Tap outside to reset the sheet
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Stack(
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        "PORTER°",
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 120),
                      Center(
                        child: Image.asset(
                          "assets/image/login_dboy.png",
                          height: 300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Align(
                    alignment:
                        Alignment.bottomCenter, // Or any alignment you prefer
                    child: DraggableScrollableSheet(
                      initialChildSize: childSize,
                      minChildSize: 0.34,
                      maxChildSize: 0.75,
                      builder: (context, scrollController) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25)),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 5)
                              ],
                            ),
                            child: ListView(
                              controller:
                                  scrollController, // Allows smooth scrolling
                              shrinkWrap: true,
                              children: [
                                const Text(
                                  "Welcome 👋",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "With a valid number, you can access deliveries and services.",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(height: 20),
                                IntlPhoneField(
                                  decoration: InputDecoration(
                                    labelText: '   Phone Number',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.blue.shade700,
                                          width: 2), // Blue border on focus
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    prefix: const SizedBox(
                                        width:
                                            8), // Adds space between number and vertical bar
                                  ),
                                  initialCountryCode: _selectedCountryIsoCode,
                                  dropdownIconPosition: IconPosition.trailing,
                                  showDropdownIcon: true,
                                  onTap: expandSheet, // Expand when tapped
                                  onChanged: (phone) {
                                    _phoneNumber = phone;
                                    _phoneNumberController.text =
                                        phone.number ?? '';
                                  },
                                  onCountryChanged: (country) {
                                    setState(() {
                                      _selectedCountryCode =
                                          '+${country.dialCode}';
                                      _selectedCountryIsoCode = country.code;
                                    });
                                  },
                                  onSubmitted: (value) {
                                    // Call proceedLogin when done/enter is pressed on the keyboard
                                    _proceedLogin();
                                  },
                                  keyboardType: TextInputType
                                      .phone, // Specify number keyboard
                                  textInputAction:
                                      TextInputAction.done, // Show Done button
                                  dropdownDecoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          color: Colors.grey, width: 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                if (childSize > 0.34)
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue[700],
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed:
                                          _proceedLogin, // Use the _proceedLogin function
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              /// **Draggable Bottom Sheet**
              // DraggableScrollableSheet(
              //   initialChildSize: childSize,
              //   minChildSize: 0.34,
              //   maxChildSize: 0.75,
              //   builder: (context, scrollController) {
              //     return ConstrainedBox(
              //       constraints: BoxConstraints(maxWidth: 500),
              //       child: Container(
              //         padding: const EdgeInsets.all(20),
              //         decoration: const BoxDecoration(
              //           color: Colors.white,
              //           borderRadius:
              //               BorderRadius.vertical(top: Radius.circular(25)),
              //           boxShadow: [
              //             BoxShadow(color: Colors.black26, blurRadius: 5)
              //           ],
              //         ),
              //         child: ListView(
              //           controller: scrollController, // Allows smooth scrolling
              //           shrinkWrap: true,
              //           children: [
              //             const Text(
              //               "Welcome 👋",
              //               style: TextStyle(
              //                   fontSize: 22, fontWeight: FontWeight.bold),
              //             ),
              //             const SizedBox(height: 10),
              //             const Text(
              //               "With a valid number, you can access deliveries and services.",
              //               style: TextStyle(fontSize: 14, color: Colors.grey),
              //             ),
              //             const SizedBox(height: 20),
              //             IntlPhoneField(
              //               decoration: InputDecoration(
              //                 labelText: '   Phone Number',
              //                 labelStyle: TextStyle(color: Colors.grey),
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Colors.blue.shade700,
              //                       width: 2), // Blue border on focus
              //                 ),
              //                 contentPadding: EdgeInsets.symmetric(
              //                     horizontal: 15, vertical: 15),
              //                 prefix: SizedBox(
              //                     width:
              //                         8), // Adds space between number and vertical bar
              //               ),
              //               initialCountryCode: _selectedCountryIsoCode,
              //               dropdownIconPosition: IconPosition.trailing,
              //               showDropdownIcon: true,
              //               onTap: expandSheet, // Expand when tapped
              //               onChanged: (phone) {
              //                 _phoneNumber = phone;
              //                 _phoneNumberController.text = phone.number ?? '';
              //               },
              //               onCountryChanged: (country) {
              //                 setState(() {
              //                   _selectedCountryCode = '+${country.dialCode}';
              //                   _selectedCountryIsoCode = country.code;
              //                 });
              //               },
              //               onSubmitted: (value) {
              //                 // Call proceedLogin when done/enter is pressed on the keyboard
              //                 _proceedLogin();
              //               },
              //               keyboardType:
              //                   TextInputType.phone, // Specify number keyboard
              //               textInputAction:
              //                   TextInputAction.done, // Show Done button
              //               dropdownDecoration: BoxDecoration(
              //                 border: Border(
              //                   right: BorderSide(color: Colors.grey, width: 1),
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(height: 20),
              //             if (childSize > 0.34)
              //               SizedBox(
              //                 width: double.infinity,
              //                 child: ElevatedButton(
              //                   style: ElevatedButton.styleFrom(
              //                     backgroundColor: Colors.blue[700],
              //                     padding:
              //                         const EdgeInsets.symmetric(vertical: 14),
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(10),
              //                     ),
              //                   ),
              //                   onPressed:
              //                       _proceedLogin, // Use the _proceedLogin function
              //                   child: const Text(
              //                     "Login",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.white),
              //                   ),
              //                 ),
              //               ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
