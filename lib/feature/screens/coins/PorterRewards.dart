import 'package:flutter/material.dart';

class PorterRewardsScreen extends StatefulWidget {
  final String name;
  const PorterRewardsScreen({Key? key, required this.name}) : super(key: key);
  @override
  State<PorterRewardsScreen> createState() => _PorterRewardsScreenState();
}

class _PorterRewardsScreenState extends State<PorterRewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Porter Rewards",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Handle close action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Coin Value Display
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFF762EBD), // Use the purple color
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                "🪙 1 = ₹0.9",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 50),

            // Coin Amount Display
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 80.0,
                  color: Colors.grey[300],
                ),
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Encouragement Text
            Text(
              "Book more trips to get more coins!",
              style: TextStyle(
                  fontSize: 17,
                  color: Color(0xff6e120d),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            Expanded(child: Container()), // Push content to the top

            // Available Coins
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Available Coins: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.monetization_on, color: Colors.orange),
                  Text("0", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),

            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Transfer in  ", style: TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 24, // Adjust the size as needed
                    height: 24,
                    child: widget.name == "Bank Account"
                        ? Image.asset("assets/image/bhim.png")
                        : Image.asset("assets/image/wallet3d.png"),
                  ),
                  Text(
                      widget.name == "Bank Account"
                          ? "Bank Account"
                          : "Porter Credit",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle next button press
                },
                child: Text("Next"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.grey[700],
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
