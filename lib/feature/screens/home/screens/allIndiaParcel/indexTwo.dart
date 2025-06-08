import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/Edit_all_india_pickupdrop.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/package_detail.dart';

class SendPackageScreen extends StatefulWidget {
  @override
  _SendPackageScreenState createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  bool isKgSelected = true;
  bool isCmSelected = true;
  int currentStep = 0;
  final List<String> stepTitles = ["Address", "Package", "Estimate", "Review"];

  final List<IconData> stepIcons = [
    Icons.location_pin,
    Icons.inventory_2,
    Icons.grid_view,
    Icons.receipt,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
          "Send package",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(stepTitles.length, (index) {
                return Row(
                  children: [
                    _buildStep(index),
                    if (index < stepTitles.length - 1) _buildDottedLine(),
                  ],
                );
              }),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      _buildAddressCard(
                          title: "PICKUP AT",
                          location: "Chennai",
                          name: "Rubini Dharmarajan",
                          phone: "7358177393",
                          address:
                              "6, Thirumazhisai Alwar Temple, 3326+WH6 Jagannatha Perumal Koil, Thirumazhisai, Tamil Nadu 600124, India",
                          email: "rubinidharmarajan@gmail.com",
                          icon: Icons.arrow_circle_up,
                          color: Colors.green,
                          plocation: "pickup"),
                      SizedBox(height: 10),
                      _buildAddressCard(
                          title: "DROP AT",
                          location: "Kanchipuram",
                          name: "Dharma",
                          phone: "9790831260",
                          address:
                              "16, Kanchipuram, Kanchipuram, Tamil Nadu 631501, India",
                          icon: Icons.arrow_circle_down,
                          color: Colors.red,
                          plocation: "drop"),
                      SizedBox(height: 10),
                      // Standard Delivery Details
                    ],
                  ),
                  Positioned(
                    top: 23,
                    left: -13,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 24), // Adjust to align with icons
                      child: Column(
                        children: List.generate(
                          30, // Increase or decrease to control the line length
                          (index) => Container(
                            width: 2,
                            height: 4,
                            color: Colors.grey,
                            margin: const EdgeInsets.symmetric(
                                vertical: 2), // Space between dashes
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildProceedButton(context),
    );
  }

  Widget _buildAddressCard({
    required String title,
    required String location,
    required String name,
    required String phone,
    required String address,
    required String plocation,
    String? email,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(100),
              color: icon == Icons.arrow_circle_up
                  ? Colors.green
                  : icon == Icons.arrow_circle_down
                      ? Colors.red
                      : Colors.transparent,
            ),
            child: Icon(icon,
                color: icon == Icons.arrow_circle_up ||
                        icon == Icons.arrow_circle_down
                    ? Colors.white
                    : Colors.black)),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DropDetailsScreen(
                                    location: "${plocation}")));
                      },
                      child: const Text("Edit"),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text("$name • $phone"),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(address, style: TextStyle(color: Colors.grey)),
                ),
                if (email != null) ...[
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.grey, size: 18),
                      SizedBox(width: 4),
                      Text(email, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SendPackage(),
              ),
            );
          },
          child: Text("Proceed",
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildStep(int index) {
    bool isCompleted = index < currentStep;
    bool isActive = index == currentStep;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? Colors.green
                : isActive
                    ? Colors.blue[700]
                    : Colors.white,
            border: Border.all(
              color: isCompleted
                  ? Colors.green
                  : isActive
                      ? Colors.blue[700]!
                      : Colors.grey,
              width: 1.5,
            ),
          ),
          child: Icon(
            isCompleted ? Icons.check : stepIcons[index],
            color: isCompleted || isActive ? Colors.white : Colors.grey,
            size: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          stepTitles[index],
          style: TextStyle(
            fontSize: 10,
            color: isActive || isCompleted ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Container(
      width: 30,
      height: 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              10,
              (index) => Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeightUnitButtons() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isKgSelected = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isKgSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: isKgSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("kg"),
        ),
        SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isKgSelected = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                !isKgSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: !isKgSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("gm"),
        ),
      ],
    );
  }

  Widget _buildSizeUnitButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isCmSelected = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isCmSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: isCmSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("cm"),
        ),
        SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isCmSelected = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                !isCmSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: !isCmSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("inch"),
        ),
      ],
    );
  }
}
