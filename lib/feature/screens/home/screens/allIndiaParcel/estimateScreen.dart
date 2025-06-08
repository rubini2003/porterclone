import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/AllParcelReviewScreen.dart';
import 'package:porter_clone/helper/dimension.dart';

class estimatePage extends StatefulWidget {
  const estimatePage({Key? key}) : super(key: key);

  @override
  State<estimatePage> createState() => _EstimatePageState();
}

class _EstimatePageState extends State<estimatePage> {
  int currentStep = 2;
  bool _isDropdownOpen = false;
  int? _selectedOption = 0;
  String _selectedLabel = "Ecom Express"; // Initial default value
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Send package",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Need help?"),
          ),
        ],
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            const SizedBox(height: 20),
            const Text(
              "When do you want to deliver it ?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "%",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "STANDARD",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Estimated delivery"),
                          Text("11 Mar - 12 Mar"),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        "₹167",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: List.generate(
                  //     50, // Adjust the number of hyphens as needed
                  //     (index) => Text(
                  //       '-',
                  //       style: TextStyle(
                  //           fontSize: 16.0,
                  //           color:
                  //               Colors.grey[400]), // Customize the appearance
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isDropdownOpen = !_isDropdownOpen;
                      });
                    },
                    child: Row(
                      children: [
                        const Text("FULL-FILLED BY ("),
                        Text(_selectedLabel),
                        const Text(")"),
                        Icon(_isDropdownOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  if (_isDropdownOpen)
                    Column(
                      children: [
                        _buildDropdownOption(0, "Ecom Express",
                            "Estimated delivery(11 Mar - 12 Mar)", "₹167"),
                        _buildDropdownOption(1, "Xpressbees",
                            "Estimated delivery(11 Mar - 12 Mar)", "₹168"),
                      ],
                    ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    child: Image.asset('assets/image/delivery_man_join.png',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                        color: Colors.green),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pickup by Tomorrow (08 Mar)"),
                      Text("Between 11:30 AM - 2 PM"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllParcelReview()));
                },
                child: const Text("Proceed",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
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

  Widget _buildDropdownOption(
      int index, String label, String Value, String price) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = index;
          _selectedLabel = label; // Update the label
          _isDropdownOpen = false; //close the dropdown
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Radio<int>(
              value: index,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value;
                  _selectedLabel = label; // Update the label
                  _isDropdownOpen = false; // close the dropdown
                });
              },
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //Added CrossAxisAlignment
              children: [
                Text(
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeExtraLarge),
                ),
                Text(Value)
              ],
            ),
            const Spacer(),
            Text(
              price,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSizeDefault),
            ),
          ],
        ),
      ),
    );
  }
}
