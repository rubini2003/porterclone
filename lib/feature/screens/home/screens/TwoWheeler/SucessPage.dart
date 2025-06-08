import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:porter_clone/feature/screens/BottomNav/bottomNavigation.dart';

import '../../../accounts/HelpandSupportScreen.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the MainScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
        return false; // Prevent the default back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
          title: Column(
            children: [
              Text(
                'Trip CRN1974885566',
                style: TextStyle(
                    color: Colors.black, fontSize: 18), // Adjusted font size
              ),
              Text(
                'Booking confirmed',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          centerTitle: false, // Align title to the left
          actions: [
            TextButton.icon(
              // Use TextButton.icon for combined icon and text
              onPressed: () {
                // Handle info tap
                print('Info tapped');
              },
              icon: Icon(Icons.info_outline, color: Colors.blue),
              label: Text('Info', style: TextStyle(color: Colors.blue)),
            ),
            IconButton(
              // Just IconButton for share
              icon: Icon(Icons.share, color: Colors.blue),
              onPressed: () {
                // Handle share tap
                print('Share tapped');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            // Google Map
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target:
                    LatLng(13.0827, 80.2707), // Example coordinates for Chennai
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('origin'),
                  position: LatLng(13.0827, 80.2707), // Example origin
                ),
                Marker(
                  markerId: MarkerId('destination'),
                  position: LatLng(13.0500, 80.2000), // Example destination
                ),
              },
            ),
            // Top Navigation Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    // Handle back navigation
                  },
                ),
                title: Text(
                  'Trip CRN1974885566',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: false,
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Info', style: TextStyle(color: Colors.blue)),
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Booking confirmed',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Draggable Sheet
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Image.asset(
                          "assets/image/delivey_done.png",
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Booking Done ',
                                style: TextStyle(fontSize: 16)),
                            Icon(Icons.check_circle, color: Colors.green),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          'Searching for a driver...',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          'Booking will get cancelled if not allocated in 09:46',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      Container(
                        color: Colors.grey[100],
                        child: Column(
                          children: [
                            SizedBox(height: 20),
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

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(16.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/image/cash_on_delivery.png', // Replace with your cash icon asset
                                          width: 24,
                                          height: 24,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cash',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Payment Method',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '₹53',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // Handle view breakup tap
                                            print('View Breakup tapped');
                                          },
                                          child: Text(
                                            'View Breakup',
                                            style: TextStyle(
                                              color: Colors.blue[700],
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Support Card
                            Card(
                              margin: EdgeInsets.symmetric(horizontal: 16.0),
                              color:
                                  Colors.blue.shade50, // Light blue background
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.headset_mic, color: Colors.blue),
                                    SizedBox(width: 8),
                                    InkWell(
                                      onTap: () {
                                        // Handle contact support tap
                                        print('Contact Support tapped');
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Facing issue in this order?',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'Contact Support',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Cancel Trip Button
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                onPressed: () {
                                  // Handle cancel trip tap
                                  print('Cancel Trip tapped');
                                },
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  foregroundColor: Colors.red[700],
                                ),
                                child: Text('Cancel Trip'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              // Address Details (with dotted line)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.green),
                      SizedBox(
                          height:
                              2), // Small gap between the icon and dotted line
                      CustomPaint(
                        size: Size(
                            1, 70), // Adjust height to fit between both icons
                        painter: DottedLinePainter(),
                      ),
                      SizedBox(height: 2), // Small gap before the red icon
                      Icon(Icons.location_pin, size: 15, color: Colors.red),
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
              ),

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
        ),
      ),
    );
  }
}
