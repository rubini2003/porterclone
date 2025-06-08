import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Payment",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Porter credits",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage2()));
                        },
                        child: Text("Balance ₹0"),
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade50,
                          foregroundColor: Colors.blue),
                      onPressed: () => _showAddMoneySheet(context),
                      child: Text("Add Money"))
                ],
              ),
              Divider()
            ],
          ),
        ),
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
                              Navigator.pop(context);
                            }
                          : null,
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
//                               Navigator.pop(context); // Close bottom sheet
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

class PaymentPage2 extends StatefulWidget {
  const PaymentPage2({super.key});

  @override
  State<PaymentPage2> createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Porter Credits"),
        centerTitle: true, // Centers the title
        elevation: 4, // Adds shadow effect
        shadowColor: Colors.black.withOpacity(0.2), // Shadow color
        backgroundColor: Colors.white, // Optional: Background color
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blue.shade50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Balance ₹0",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () => _showAddMoneySheet(context),
                      child: Text(
                        "Add Money",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
