import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/Payment_method.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   title: Text("Order Summary"),
      // ), // Remove AppBar
      body: Container(
        color: Colors.white, // Set background color to white
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Order summary',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total amount', style: TextStyle(fontSize: 16)),
                          Text('₹919', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payable after shifting',
                              style: TextStyle(fontSize: 16)),
                          Text('₹819', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[50], // Light grey background
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Pay booking amount',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text('₹100',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Booking amount of flat Rs. 100 needs to be paid for order confirmation',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'After successful movement pay the remaining amount to the partner.',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Service offers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50], // Light grey background
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/image/porter.png",
                          height: 60, width: 60),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mini truck',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('TATA Ace (7L x 4.8W x 4.8H)',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/image/dboy.png",
                          height: 60, width: 60),
                      SizedBox(width: 16),
                      Expanded(
                        // Wrap the Column in Expanded
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Labour',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            AutoSizeText(
                              '1 Dedicated labour along with the driver for loading & unloading assistance.',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                              maxLines: 2, // Optional: Limit to 2 lines
                              overflow: TextOverflow
                                  .ellipsis, // Optional: Handle overflow
                              minFontSize:
                                  10, // Optional: Set minimum font size
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  child: Text(
                    'Terms and conditions',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    // Handle terms and conditions tap
                  },
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: const Text(
                    'Booking details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Friday, March 21, 2025 12:00 PM',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 12,
                              ),
                              SizedBox(width: 8),
                              Text('Poonamallee bus stand, Poonamallee ...'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 12,
                              ),
                              SizedBox(width: 8),
                              Text('Thirumazhisai, Tamil Nadu, India'),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Items to be shifted',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('Electronics'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Rounded rectangle
                  ),
                ),
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10), // Space between buttons

            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  showTermsAndConditionsBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Rounded rectangle
                  ),
                ),
                child: Text(
                  "Book Now",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTermsAndConditionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take up more space
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        bool isChecked = false; // State to manage the checkbox

        return StatefulBuilder(
          // Needed to update checkbox state
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .viewInsets
                      .bottom), // Avoid keyboard overlap
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Terms and conditions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• This service does NOT include rope pulling, packaging & dismantling of goods.",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "• Max weight for any item must NOT exceed 50 kg.",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "• For moving fragile or heavy goods (bed, almirah, etc) opt for our Packers and Movers service.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                          activeColor: Colors.blue[700],
                          checkColor: Colors.white,
                        ),
                        Text("Yes, I understand the service"),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isChecked
                            ? () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PaymentMethodsScreen()));
                              }
                            : null, // Disable button if not checked
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isChecked ? Colors.blue[700] : Colors.grey[300],
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          foregroundColor: Colors.black,
                          disabledBackgroundColor: Colors.grey[300],
                          disabledForegroundColor: Colors.grey,
                        ),
                        child: Text(
                          "PROCEED TO PAY",
                          style: TextStyle(
                              color: isChecked ? Colors.white : Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
