// import 'package:flutter/material.dart';
//
// class HelpSupportScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Help & Support', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeaderSection(),
//             _buildOrderSupportCard(),
//             _buildMoreOrdersLink(),
//             _buildHelpTopics(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeaderSection() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       color: Colors.blue.shade50,
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'How can we help you?',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text('Please get in touch and we will be happy to help you.')
//               ],
//             ),
//           ),
//           Image.asset(
//             'assets/image/tele1.png', // Replace with actual image
//             height: 80,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderSupportCard() {
//     return Container(
//       margin: EdgeInsets.all(16),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 1)
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.directions_bike, color: Colors.black),
//                   SizedBox(width: 8),
//                   Text('2 Wheeler'),
//                 ],
//               ),
//               Text('₹0.0', style: TextStyle(fontWeight: FontWeight.bold)),
//             ],
//           ),
//           SizedBox(height: 6),
//           Text('Mar 13 2025, 03:48 PM',
//               style: TextStyle(color: Colors.grey.shade600)),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.location_pin, color: Colors.green),
//             title: Text('Rubini Dharmarajan - 7358177393'),
//             subtitle: Text('Poonamallee High Rd, Alwartirunagar, Madura...'),
//           ),
//           ListTile(
//             leading: Icon(Icons.location_pin, color: Colors.red),
//             title: Text('Rubini Dharmarajan - 7358177393'),
//             subtitle:
//                 Text('Poonamallee bus stand, Poonamallee - Avadi High...'),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('❌ Cancelled', style: TextStyle(color: Colors.red)),
//               ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: Icon(Icons.report_gmailerrorred),
//                 label: Text('Report Issue'),
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMoreOrdersLink() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: TextButton(
//         onPressed: () {},
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Show more orders', style: TextStyle(color: Colors.blue)),
//             Icon(Icons.arrow_forward, color: Colors.blue),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHelpTopics() {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('OTHER HELP TOPICS',
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//           SizedBox(height: 8),
//           _buildHelpTopic('Update my account details',
//               'Check & update account related info', Icons.person),
//           _buildHelpTopic('Know more about the pricing',
//               'Get details about fare, invoices, etc', Icons.attach_money),
//           _buildHelpTopic(
//               'Learn more about my wallet',
//               'Get details & payment mode related info',
//               Icons.account_balance_wallet),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHelpTopic(String title, String subtitle, IconData icon) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.black),
//       title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: Text(subtitle),
//       trailing: Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: () {},
//     );
//   }
// }
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Background color of the whole screen
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Help & Support", style: TextStyle(color: Colors.black)),
        centerTitle: false, // Align title to the left
      ),
      body: SingleChildScrollView(
        // Make the screen scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue[50], // Light blue background
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("How can we help you?",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text(
                            "Please get in touch and we will be happy to help you."),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Image.asset('assets/image/telecaller.png',
                      width: 100), // Replace with your image asset
                ],
              ),
            ),

            SizedBox(height: 16),

            // Order Card (Repeat this for each order)
            _buildOrderCard(),

            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("OTHER HELP TOPICS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[600])),
            ),
            SizedBox(height: 8),

            // Help Topics List (Repeat this for each topic)
            _buildHelpTopicTile(
                icon: Icons.person,
                title: "Update my account details",
                description: "Check & update account related info"),
            _buildHelpTopicTile(
                icon: Icons.attach_money,
                title: "Know more about the pricing",
                description: "Get details about fare, invoices, etc"),
            _buildHelpTopicTile(
                icon: Icons.wallet,
                title: "Learn more about my wallet",
                description: "Get wallet & payment mode related info"),
            _buildHelpTopicTile(
                icon: Icons.star,
                title: "Explore Porter Gold",
                description: "Info on buying & renew porter Gold"),
            _buildHelpTopicTile(
                icon: Icons.home_repair_service,
                title: "Learn about Porter services",
                description: "Understand services offered by Porter "),
            _buildHelpTopicTile(
                icon: Icons.shield_outlined,
                title: "Understand safety procrdures",
                description: "Know more about safety & insurance"),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard() {
    return Container(
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
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("NEED HELP WITH RECENT ORDERS?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[600])),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1, // Border width
                  color: Colors.grey, // Border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/scooter.png",
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 8),
                                Text("2 Wheeler",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text("Mar 13 2025, 03:48 PM",
                                    style: TextStyle(color: Colors.grey[600])),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          // Added a row to keep the text and icon together
                          children: [
                            Text("₹ 0.0 "), // Added a space after the amount
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Address Details (with dotted line)
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20)),
                        child: _buildAddressDetails()),

                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ⓧ Cancelled",
                            style: TextStyle(color: Colors.red)),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.headset_mic, color: Colors.white),
                          label: Text("Report Issue",
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text("Show more orders",
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.circle, size: 8, color: Colors.green),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                  "Rubini Dharmarajan • 7358177393\nPoonamallee High Rd, Alwartirunagar, Madura...",
                  style: TextStyle(color: Colors.black87)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: CustomPaint(
            painter: DottedLinePainter(),
            size: Size(1, 20), // Adjust height as needed
          ),
        ),
        Row(
          children: [
            Icon(Icons.location_on, size: 10, color: Colors.red),
            SizedBox(width: 2),
            Expanded(
              child: Text(
                  "Rubini Dharmarajan • 7358177393\nPoonamallee bus stand, Poonamallee - Avadi Hig...",
                  style: TextStyle(color: Colors.black87)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHelpTopicTile(
      {required IconData icon,
      required String title,
      required String description}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 4, // Blur radius (similar to elevation)
            spreadRadius: 1, // Spread radius
            offset: Offset(0, 2), // Offset for the shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.grey[700]),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}

// Custom Painter for Dotted Line
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final dashWidth = 2;
    final dashSpace = 3;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
