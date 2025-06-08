import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:porter_clone/feature/screens/BottomNav/bottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerificationPage extends StatefulWidget {
  final String mobileNumber;

  const OtpVerificationPage({Key? key, required this.mobileNumber})
      : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpValid = false; // Tracks whether OTP is entered completely
  bool isLogin = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _onOtpChanged(String otp) {
    setState(() {
      _isOtpValid = otp.length == 6; // Enable button when OTP is 6 digits
    });
  }

  Future<void> _verifyOtp() async {
    if (_otpController.text == "123456") {
      print("OTP Verified: ${_otpController.text}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      print("Invalid OTP");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid OTP. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "PORTER°",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.mobileNumber,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "CHANGE",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "One Time Password (OTP) has been sent to this number",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  controller: _otpController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  onChanged: _onOtpChanged,
                  showCursor: true,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isOtpValid ? _verifyOtp : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isOtpValid
                          ? Colors.blue.shade700
                          : Colors.grey.shade300,
                      foregroundColor:
                          _isOtpValid ? Colors.white : Colors.grey.shade800,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Verify",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/image/whatsapp_icon.png', // Path to your WhatsApp icon
                    width: 24, // Adjust the size as needed
                    height: 24,
                    color: Colors.grey.shade600,
                  ),
                  label: Text(
                    "Get OTP via WhatsApp",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.sms, color: Colors.grey.shade600),
                  label: Text(
                    "Resend OTP via SMS",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class OtpVerificationPage extends StatefulWidget {
//   final String mobileNumber;
//
//   OtpVerificationPage({required this.mobileNumber});
//   @override
//   State<OtpVerificationPage> createState() => _OtpVerificationPageState();
// }
//
// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(30, 60, 87, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200, // Slightly darker background
//         border: Border.all(color: Colors.grey.shade400), // Subtle border
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//
//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(10),
//     );
//
//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration!.copyWith(
//         color: Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Center(
//                 child: Text(
//                   "PORTER°",
//                   style: TextStyle(
//                     fontSize: 48,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.blue.shade900,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Image.asset(
//                   //   'assets/india_flag.png', // Replace with your image path
//                   //   width: 24,
//                   //   height: 16,
//                   // ),
//                   SizedBox(width: 5),
//                   Text(
//                     "${widget.mobileNumber}",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "CHANGE",
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Pinput(
//                 length: 6, // Or whatever OTP length you need
//                 defaultPinTheme: defaultPinTheme,
//                 focusedPinTheme: focusedPinTheme,
//                 submittedPinTheme: submittedPinTheme,
//                 pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                 showCursor: true,
//                 onCompleted: (pin) => print("OTP is $pin"), // Handle OTP
//               ),
//               SizedBox(height: 5),
//               Text(
//                 "One Time Password (OTP) has been sent to this number",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey.shade600,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               // SizedBox(height: 20),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     Text(
//               //       ") ",
//               //       style: TextStyle(
//               //         fontSize: 18,
//               //       ),
//               //     ),
//               //     Text(
//               //       "Waiting to auto verify OTP",
//               //       style: TextStyle(
//               //         fontSize: 14,
//               //         fontWeight: FontWeight.w500,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               // SizedBox(height: 30),
//               Text(
//                 "Enter OTP manually",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Verify",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey.shade300,
//                     foregroundColor: Colors.grey.shade800,
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextButton.icon(
//                 onPressed: () {},
//                 icon: Icon(Icons.message, color: Colors.grey.shade600),
//                 label: Text(
//                   "Get OTP via WhatsApp",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey.shade600,
//                   ),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.white),
//                   padding: MaterialStateProperty.all(
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextButton.icon(
//                 onPressed: () {},
//                 icon: Icon(Icons.sms, color: Colors.grey.shade600),
//                 label: Text(
//                   "Resend OTP via SMS",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey.shade600,
//                   ),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.white),
//                   padding: MaterialStateProperty.all(
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
