import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildOrderCard(
                amount: "250",
                image: "assets/image/scooter.png",
                VehicleType: "Twowheeler",
                DateandTime: "Mar 13 2025, 03:48 PM",
                Pickupname: "Mega Mukesh",
                Pickupphone: 8056052289,
                Completed: true,
                PickupAddress:
                    "ARK, Vigneshwara Nagar, 198 B, near Alpha Colleg...",
                Dropname: "Mukesh ",
                Dropphone: 8056052289,
                DropAddress:
                    "Thirumurugan Rd, Kamala Nagar, Porur, Chennai..."),
            _buildOrderCard(
                amount: "1250",
                image: "assets/image/mini.png",
                VehicleType: "Mini Truck",
                DateandTime: "Mar 29 2025, 09:48 PM",
                Pickupname: "Mega Mukesh",
                Pickupphone: 8056052289,
                Completed: false,
                PickupAddress:
                    "ARK, Vigneshwara Nagar, 198 B, near Alpha College...",
                Dropname: "Aparna",
                Dropphone: 7358177393,
                DropAddress:
                    "Thirumurugan Rd, Kamala Nagar, Porur, Chennai..."),
            _buildOrderCard(
                amount: "250",
                image: "assets/image/scooter.png",
                VehicleType: "Twowheeler",
                DateandTime: "Mar 13 2025, 03:48 PM",
                Pickupname: "Mega Mukesh",
                Pickupphone: 8056052289,
                Completed: true,
                PickupAddress:
                    "ARK, Vigneshwara Nagar, 198 B, near Alpha Colleg...",
                Dropname: "Madhavan",
                Dropphone: 8056052489,
                DropAddress:
                    "Thirumurugan Rd, Kamala Nagar, Porur, Chennai..."),
            _buildOrderCard(
                amount: "250",
                image: "assets/image/scooter.png",
                VehicleType: "Twowheeler",
                DateandTime: "Mar 13 2025, 03:48 PM",
                Pickupname: "Mega Mukesh",
                Pickupphone: 8056052489,
                Completed: false,
                PickupAddress:
                    "ARK, Vigneshwara Nagar, 198 B, near Alpha Colleg...",
                Dropname: "Mukesh ",
                Dropphone: 8056052289,
                DropAddress:
                    "Thirumurugan Rd, Kamala Nagar, Porur, Chennai..."),
          ],
        ),
      ),
    );
  }
}

Widget _buildOrderCard({
  required String amount,
  required String image,
  required String Pickupname,
  required String Dropname,
  required int Pickupphone,
  required int Dropphone,
  required bool Completed,
  required String DateandTime,
  required String PickupAddress,
  required String DropAddress,
  required String VehicleType,
}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
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
        // borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Text("NEED HELP WITH RECENT ORDERS?",
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold, color: Colors.grey[600])),
            // ),
            SizedBox(height: 8),
            Column(
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
                          image,
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
                            Text(VehicleType,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(DateandTime,
                                style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      // Added a row to keep the text and icon together
                      children: [
                        Text("₹${amount}"), // Added a space after the amount
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.circle, size: 10, color: Colors.green),
                            SizedBox(
                                height:
                                    2), // Small gap between the icon and dotted line
                            CustomPaint(
                              size: Size(1,
                                  70), // Adjust height to fit between both icons
                              painter: DottedLinePainter(),
                            ),
                            SizedBox(
                                height: 2), // Small gap before the red icon
                            Icon(Icons.location_pin,
                                size: 15, color: Colors.red),
                          ],
                        ),
                        SizedBox(width: 6), // Spacing between icons and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${Pickupname} • ${Pickupphone}\n${PickupAddress}",
                                style: TextStyle(color: Colors.black87),
                              ),
                              SizedBox(height: 10), // Space between texts
                              Text(
                                "${Dropname} • ${Dropphone}\n${DropAddress}",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),

                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Completed ? Icons.check_circle : Icons.cancel,
                          color: Completed ? Colors.green : Colors.red,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          Completed ? "Completed" : "Cancelled",
                          style: TextStyle(
                              color: Completed ? Colors.green : Colors.red),
                        ),
                      ],
                    ),
                    Completed
                        ? ElevatedButton(
                            onPressed: () {},
                            child: Text("Book Again",
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                backgroundColor: Colors.blue),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            // Center(
            //   child: TextButton(
            //     onPressed: () {},
            //     child: Text("Show more orders",
            //         style: TextStyle(color: Colors.blue)),
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}

/// Custom Painter for Dotted Line
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double dashHeight = 4, dashSpace = 3, startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Widget _buildAddressDetails() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         children: [
//           Icon(Icons.circle, size: 8, color: Colors.green),
//           SizedBox(width: 4),
//           Expanded(
//             child: Text(
//                 "Rubini Dharmarajan • 7358177393\nPoonamallee High Rd, Alwartirunagar, Madura...",
//                 style: TextStyle(color: Colors.black87)),
//           ),
//         ],
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 5.0),
//         child: CustomPaint(
//           painter: DottedLinePainter(),
//           size: Size(1, 20), // Adjust height as needed
//         ),
//       ),
//       Row(
//         children: [
//           Icon(Icons.location_on, size: 10, color: Colors.red),
//           SizedBox(width: 2),
//           Expanded(
//             child: Text(
//                 "Rubini Dharmarajan • 7358177393\nPoonamallee bus stand, Poonamallee - Avadi Hig...",
//                 style: TextStyle(color: Colors.black87)),
//           ),
//         ],
//       ),
//     ],
//   );
// }
