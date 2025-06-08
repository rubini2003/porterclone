import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/Edit_all_india_pickupdrop.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/Review_bottomsheet.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/package_detail.dart';
import 'package:porter_clone/helper/dimension.dart';

class AllParcelReview extends StatefulWidget {
  const AllParcelReview({Key? key}) : super(key: key);

  @override
  State<AllParcelReview> createState() => _AllParcelReviewState();
}

class _AllParcelReviewState extends State<AllParcelReview> {
  int currentStep = 3;
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Text(
                        "Shipping details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      // Sender Details
                      _buildShippingDetailRow(
                        icon: Icons.arrow_upward,
                        title: "Rubini Dharmarajan • 7358177393",
                        subtitle:
                            "6, Thirumazhisai Alwar Temple, 3326+WH6 Jagan...",
                        onEdit: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DropDetailsScreen(location: "pickup")));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Divider(),
                      ),
                      const SizedBox(height: 10),
                      // Receiver Details
                      _buildShippingDetailRow(
                        icon: Icons.arrow_downward,
                        title: "Dharma • 9790831260",
                        subtitle:
                            "16, Kanchipuram, Kanchipuram, Tamil Nadu 63150...",
                        onEdit: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DropDetailsScreen(location: "drop")));
                        },
                      ),
                      const SizedBox(height: 10),
                      // Standard Delivery Details
                      _buildShippingDetailRow(
                        icon: Icons.calendar_today,
                        title: "STANDARD",
                        subtitle:
                            "Estimated delivery by 11 Mar - 12 Mar\nPickup on 8 Mar • Between 11:30am - 2pm",
                        onEdit: () {},
                      ),
                    ],
                  ),
                  Positioned(
                    top: 75,
                    left: -13,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 24), // Adjust to align with icons
                      child: Column(
                        children: List.generate(
                          10, // Increase or decrease to control the line length
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
            Container(
              height: 10,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: 10),
            // Package Details
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Package Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSizeExtraLarge),
                    ),
                  ),
                  _buildShippingDetailRow(
                    icon: Icons.shopping_bag,
                    title: "Household items   2.00 Kg",
                    subtitle: "3 cm x 5 cm x 4 cm",
                    onEdit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SendPackage()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: 10),
            // Coupons & Offers
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Handle the tap to view coupons & offers
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/image/discount_offer_icon.png",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text("Coupons & offers"),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 10,
              color: Colors.grey.shade200,
            ),
            // Package Protect
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Package PROTECT",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Claim coverage in case of loss or damage"),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle, color: Colors.green, size: 32),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Package Value Section
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Package value declared: ₹500',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue:
                                  false, // Change this to a stateful variable
                              onChanged: (value) {
                                // Implement your logic here to handle selection
                              },
                            ),
                            Text('Claim upto ₹600'),
                            Spacer(),
                            Text('₹15'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: false,
                              groupValue:
                                  false, // Change this to a stateful variable
                              onChanged: (value) {
                                // Implement your logic here to handle selection
                              },
                            ),
                            Text('Not needed'),
                            Spacer(),
                            Text('₹0'),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Refer to Package PROTECT section under intercity courier T&C\'s',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0),

                  // Payment Summary
                  Text(
                    'Payment Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  _buildPaymentRow('Shipping charge', '₹185.60'),
                  SizedBox(height: 8.0),
                  _buildPaymentRow('Subtotal', '₹185.60'),
                  SizedBox(height: 8.0),
                  _buildPaymentRow('CGST @ 9%', '₹16.70'),
                  SizedBox(height: 8.0),
                  _buildPaymentRow('SGST/UTGST @ 9%', '₹16.70'),
                  SizedBox(height: 24.0),
                  _buildPaymentRow('Amount to be paid', '₹219', isBold: true),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16), // Add padding around the button
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Important to wrap content properly
          children: [
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
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context)=>()
                  // ));
                  _showBottomSheet(context);
                },
                child: const Text("Proceed to Pay - ₹219",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "By proceeding, you agree to our Terms & Conditions",
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildStep(int index) {
    bool isCompleted = index < currentStep;
    bool isActive = index == currentStep;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
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

  Widget _buildShippingDetailRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onEdit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(100),
                color: icon == Icons.arrow_upward
                    ? Colors.green
                    : icon == Icons.arrow_downward
                        ? Colors.red
                        : Colors.transparent,
              ),
              child: Icon(icon,
                  color:
                      icon == Icons.arrow_upward || icon == Icons.arrow_downward
                          ? Colors.white
                          : Colors.black)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle),
              ],
            ),
          ),
          TextButton(
            onPressed: onEdit,
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.blue[700]),
            ),
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the sheet to take up more space
    builder: (BuildContext context) {
      return BottomSheetContent();
    },
  );
}
