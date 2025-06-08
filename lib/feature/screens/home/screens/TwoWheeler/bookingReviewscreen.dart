import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/Payment_method.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/SucessPage.dart';
import 'package:porter_clone/helper/dimension.dart';

class ReviewBookingScreen extends StatelessWidget {
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
        title: Text('Review Booking', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/image/scooter.png', // Replace with your scooter image path
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('2 Wheeler',
                                    style: TextStyle(fontSize: 16)),
                                GestureDetector(
                                  onTap: () {
                                    // Handle view address details tap
                                  },
                                  child: Text(
                                    'View Address Details',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text('3 mins away',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14)), // Right aligned
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.greenAccent, Colors.white],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(Icons.access_time,
                                    color: Colors.grey, size: 16),
                                SizedBox(width: 4),
                                Text(
                                    'Free 25 mins of loading-unloading time included.',
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 12)),
                                Spacer(),
                                Icon(Icons.info_outline,
                                    color: Colors.grey, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Offers and Discounts',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.confirmation_num, color: Colors.green),
                        SizedBox(width: 8),
                        Text('Apply Coupon', style: TextStyle(fontSize: 16)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 16),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.orange),
                            SizedBox(width: 8),
                            Text('Minimum 25 coins required',
                                style: TextStyle(fontSize: 16)),
                            Spacer(),
                            Text('Use Coins',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                      child: Text(
                        "You'll get 2 coins on this order ✨",
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeDefault,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Fare Summary',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        FareRow(
                            title: 'Trip Fare (incl. Toll)', amount: '₹58.34'),
                        FareRow(title: 'Net Fare', amount: '₹58'),
                        FareRow(
                            title: 'Amount Payable (rounded)', amount: '₹58'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.inventory_2_outlined,
                                        color:
                                            Colors.grey), // Icon for Goods Type
                                    const SizedBox(width: 8.0),
                                    const Text(
                                      'Goods Type',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'Change',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'General • Loose',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Read before Booking
                      const Text(
                        'Read before Booking',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),

                      // Booking Information List
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            BookingInfoItem(
                                text:
                                    'Fare includes 25 mins free loading/unloading time.'),
                            BookingInfoItem(
                                text:
                                    '₹ 2.0/min for additional loading/unloading time.'),
                            BookingInfoItem(
                                text:
                                    'Fare may vary as per market conditions.'),
                            BookingInfoItem(
                                text:
                                    'Fare may change if route or location changes.'),
                            BookingInfoItem(
                                text:
                                    'Parking charges to be paid by customer.'),
                            BookingInfoItem(
                                text:
                                    'Fare includes toll and permit charges, if any.'),
                            BookingInfoItem(
                                text: "We don't allow overloading."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/image/cash_on_delivery.png', // Replace with your cash icon image path
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 8),
                  // DropdownButton<String>(
                  //   value: 'Cash', // Set the initial value
                  //   items: <String>['Cash'].map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     // Handle dropdown value change
                  //   },
                  //   underline: Container(), // Remove the underline
                  // ),
                  GestureDetector(
                    onTap: () {
                      _showPaymentSheet(context);
                      print("Tapped on payment method");
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cash', style: TextStyle(fontSize: 16)),
                          Icon(Icons.arrow_drop_down), // Mimic a dropdown icon
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Text('₹58',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View Breakup',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SuccessPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded rectangle shape
                    ),
                  ),
                  child: Text('Book 2 Wheeler',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FareRow extends StatelessWidget {
  final String title;
  final String amount;

  const FareRow({Key? key, required this.title, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[800])),
        Text(amount, style: TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
  }
}

class BookingInfoItem extends StatelessWidget {
  const BookingInfoItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•'), // Bullet point
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}

void _showPaymentSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the bottom sheet to take up more space
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return PaymentBottomSheet();
    },
  );
}

class PaymentBottomSheet extends StatefulWidget {
  @override
  _PaymentBottomSheetState createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  bool _cashSelected = true; // Initially, cash is selected

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around the entire sheet
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18), // Increase title font size
            ),
            trailing: Icon(Icons.keyboard_arrow_down),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0), // Consistent padding
          ),
          Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Payment Methods',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),

          Card(
            elevation: 0, // Remove shadow, consistent with design
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/image/wallet.png',
                    width: 30, // Match image size to original
                    height: 30,
                  ),
                  title: Text('Use Porter Credit (₹0)'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  subtitle: Row(
                    children: [
                      Image.asset(
                        'assets/image/bhim.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 4),
                      Image.asset(
                        'assets/image/master.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 4),
                      Image.asset(
                        'assets/image/visa.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 4),
                      Image.asset(
                        'assets/image/master.png',
                        width: 20,
                        height: 20,
                      ),
                      // SizedBox(width: 4),
                      // Image.asset(
                      //   'assets/rupay2.png',
                      //   width: 20,
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 64.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => _showAddMoneySheet(context),
                      child: Text(
                        'ADD MONEY',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 0, // Remove shadow, consistent with design
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: ListTile(
              leading: Image.asset(
                'assets/image/cash_on_delivery.png',
                width: 30, // Match image size to original
                height: 30,
              ),
              title: Text('Cash'),
              trailing: Radio<bool>(
                value: true,
                groupValue: _cashSelected,
                onChanged: (bool? value) {
                  setState(() {
                    _cashSelected = value!;
                  });
                },
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              onTap: () {
                setState(() {
                  _cashSelected = true;
                });
              },
            ),
          ),

          SizedBox(height: 16), // Add spacing

          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Padding for the button
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 16), // Button text size
                ),
                onPressed: () {
                  print("dcdfd");
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SuccessPage())); // Close the bottom sheet
                },
                child: Text('Confirm\nPay ₹53 using Cash',
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showAddMoneySheet(BuildContext context) {
  final TextEditingController amountController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add money",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            controller: amountController,
                            focusNode: focusNode,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: "Enter amount",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Use Flexible to allow wrapping, but restrict height.
                      Flexible(
                        child: SizedBox(
                          height: 30, // Fixed height for the button row
                          child: SingleChildScrollView(
                            // Allow horizontal scrolling if buttons overflow
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Added for alignment
                              children: [500, 1000, 2000].map((amount) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 4), // Add right padding
                                  child: ElevatedButton(
                                    onPressed: () {
                                      amountController.text = amount.toString();
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.blue,
                                      backgroundColor: Colors.blue.shade100,
                                      padding: EdgeInsets.zero,
                                      textStyle: TextStyle(fontSize: 10),
                                      minimumSize: Size(55,
                                          35), // Set minimum size for button
                                    ),
                                    child: Text("+$amount"),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: amountController.text.isNotEmpty
                            ? Colors.white
                            : Colors.grey,
                        backgroundColor: amountController.text.isNotEmpty
                            ? Colors.blue
                            : Colors.grey[200],
                      ),
                      onPressed: amountController.text.isNotEmpty
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentMethodsScreen())); // Close bottom sheet
                            }
                          : null, // Disabled if empty
                      child: const Text("Proceed"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  ).then((_) {
    // Dispose of focus node when bottom sheet is closed
    focusNode.dispose();
  });

  Future.delayed(Duration(milliseconds: 300), () {
    FocusScope.of(context).requestFocus(focusNode);
  });
}
//
// void _showAddMoneySheet(BuildContext context) {
//   final TextEditingController amountController = TextEditingController();
//   final FocusNode focusNode = FocusNode();
//
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true, // Ensures keyboard doesn't hide content
//     builder: (context) {
//       return Padding(
//         padding: EdgeInsets.only(
//           bottom:
//               MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
//         ),
//         child: StatefulBuilder(
//           builder: (context, setState) {
//             return Container(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 10),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       "Add money",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: SizedBox(
//                           height: 40,
//                           child: TextField(
//                             controller: amountController,
//                             focusNode: focusNode,
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center, // Centered text
//                             onChanged: (value) {
//                               setState(() {}); // Rebuild UI when text changes
//                             },
//                             decoration: InputDecoration(
//                               hintText: "Enter amount",
//                               hintStyle: TextStyle(color: Colors.grey),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Wrap(
//                           spacing: 6, // Space between buttons
//                           children: [500, 1000, 2000].map((amount) {
//                             return SizedBox(
//                               height: 35,
//                               width: 55,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   amountController.text = amount.toString();
//                                   setState(() {}); // Update UI
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   foregroundColor: Colors.blue,
//                                   backgroundColor: Colors.blue.shade100,
//                                   padding: EdgeInsets.zero,
//                                   textStyle: TextStyle(fontSize: 14),
//                                 ),
//                                 child: Text("+$amount"),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: amountController.text.isNotEmpty
//                             ? Colors.white
//                             : Colors.grey,
//                         backgroundColor: amountController.text.isNotEmpty
//                             ? Colors.blue
//                             : Colors.grey[200], // Disabled color
//                       ),
//                       onPressed: amountController.text.isNotEmpty
//                           ? () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           PaymentMethodsScreen())); // Close bottom sheet
//                             }
//                           : null, // Disabled if empty
//                       child: const Text("Proceed"),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       );
//     },
//   );
//
//   // Request focus when bottom sheet opens
//   Future.delayed(Duration(milliseconds: 300), () {
//     FocusScope.of(context).requestFocus(focusNode);
//   });
// }
