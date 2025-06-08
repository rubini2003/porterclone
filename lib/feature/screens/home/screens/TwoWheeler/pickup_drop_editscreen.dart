import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/Deliveryscreen.dart';

class PickupLocationScreen extends StatefulWidget {
  final String location;

  const PickupLocationScreen({Key? key, required this.location})
      : super(key: key);

  @override
  State<PickupLocationScreen> createState() => _PickupLocationScreenState();
}

class _PickupLocationScreenState extends State<PickupLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: (widget.location == "pickup")
                                ? "Where is your PickUp?"
                                : "Where is your Drop?",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.mic, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Type at least 4 characters to start searching",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 24),

              // Saved Addresses
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.black),
                title: Text(
                  "Saved Addresses",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.chevron_right, color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                "Recent pickups",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              SizedBox(height: 8),

              // Recent Pickups - Example 1
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.grey),
                title: Text("Nazarathpettai"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tamil Nadu 600123, India"),
                    Row(
                      children: [
                        Text("Rubini Dharm... •"),
                        Text("7358177393"),
                      ],
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, color: Colors.black),
                    Text("Save",
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ),

              // Recent Pickups - Example 2
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.grey),
                title: Text("Poonamallee High Rd"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Alwartirunagar, Maduravoyal, Chennai, Nazara..."),
                    Row(
                      children: [
                        Text("Rubini Dharm... •"),
                        Text("7358177393"),
                      ],
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, color: Colors.black),
                    Text("Save",
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.my_location, color: Colors.blue),
                    SizedBox(width: 4),
                    Text("Use current location"),
                  ],
                ),
                SizedBox(
                  height:
                      20, // Ensures the VerticalDivider has a height to show properly
                  child: VerticalDivider(
                    color: Colors.blue,
                    thickness: 1,
                    width: 20, // Adjust spacing
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeliveryScreen(
                                  location: '${widget.location}',
                                )));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 4),
                      Text("Locate on the Map"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
