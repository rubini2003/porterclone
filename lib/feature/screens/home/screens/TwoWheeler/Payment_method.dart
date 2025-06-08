// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class PaymentMethodsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: Text('Payment Methods'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Navigator.pop(context); // Example navigation
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Courier Order Payment'),
//                     Text('₹362'),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: ListTile(
//                       leading: Icon(Icons.local_offer),
//                       title: Text('Offers & Coupons available'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                     ),
//                   ),
//                   // UPI section
//                   SectionTitle(title: 'UPI'),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey[300]!),
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.white,
//                     ),
//                     padding: const EdgeInsets.all(16.0),
//                     width: MediaQuery.of(context).size.width *
//                         0.8, // or any other width you desire
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Image.asset('assets/image/upi.png', height: 40),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'Pay by Any UPI app',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                             Icon(Icons
//                                 .radio_button_unchecked), // Circle icon on the right
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'Use any UPI app on your phone to pay',
//                           style:
//                               TextStyle(fontSize: 12, color: Colors.grey[600]),
//                         ),
//                         SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(8.0),
//                                   decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: Colors.grey[300]!),
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: Colors.white,
//                                   ),
//                                   child: Image.asset('assets/image/gpay.png',
//                                       height: 40),
//                                 ), // Replace with your image asset path
//
//                                 SizedBox(height: 4),
//                                 Text('GPay'),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Column(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(8.0),
//                                   decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: Colors.grey[300]!),
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: Colors.white,
//                                   ),
//                                   child: Image.asset('assets/image/airtel.png',
//                                       height: 40),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text('Airtel'),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 16),
//                         TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                           ),
//                           child: Text(
//                             'Other UPI Options',
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Card(
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.all(16.0),
//                   //     child: Column(
//                   //       crossAxisAlignment: CrossAxisAlignment.start,
//                   //       children: [
//                   //         Row(
//                   //           children: [
//                   //             //UPI ICON
//                   //           ],
//                   //         ),
//                   //         Text('Pay by Any UPI app'),
//                   //         Text('Use any UPI app on your phone to pay'),
//                   //         Row(
//                   //           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //           children: [
//                   //             Image.asset('assets/image/gpay.png',
//                   //                 height:
//                   //                     40), // Replace with your image asset path
//                   //             Image.asset('assets/image/airtel.png',
//                   //                 height:
//                   //                     40), // Replace with your image asset path
//                   //           ],
//                   //         ),
//                   //         TextButton(
//                   //             onPressed: () {},
//                   //             child: Text('Other UPI Options')),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                   // Debit / Credit Cards section
//                   SectionTitle(title: 'Debit / Credit Cards'),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: ListTile(
//                       leading: Icon(Icons.credit_card),
//                       title: Text('Credit / Debit Card'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                     ),
//                   ),
//                   // Wallets section
//                   SectionTitle(title: 'Wallets'),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       children: [
//                         WalletListTile(
//                             title: "Amazon Pay Balance",
//                             imagePath: "assets/image/amazonpay.png"),
//                         WalletListTile(
//                             title: "Freecharge",
//                             imagePath: "assets/image/freecharge.png"),
//                         WalletListTile(
//                             title: "Jiomoney",
//                             imagePath: "assets/image/jiomoney.png"),
//                         WalletListTile(
//                             title: "MobiKwik | ZIP (Pay Later)",
//                             imagePath: "assets/image/mobwik.png"),
//                         OfferBanner(), // Display offer banner
//
//                         WalletListTile(
//                             title: "PayZapp",
//                             imagePath: "assets/image/payZapp.png"),
//
//                         WalletListTile(
//                             title: "PayPal",
//                             imagePath: "assets/image/paypal.png"),
//
//                         WalletListTile(
//                             title: "PhonePe",
//                             imagePath: "assets/image/phonepe.png"),
//                       ],
//                     ),
//                   ),
//
//                   // Netbanking section
//                   SectionTitle(title: 'Netbanking'),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: ListTile(
//                       leading: Icon(Icons.account_balance),
//                       title: Text('Netbanking'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Proceed to Pay button
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle payment processing
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text('Proceed to Pay ₹362',
//                           style: TextStyle(fontSize: 18)),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       backgroundColor: Colors.blue[700], // Button color
//                       foregroundColor: Colors.white,
//                       textStyle: TextStyle(fontSize: 18.0),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SectionTitle extends StatelessWidget {
//   final String title;
//
//   const SectionTitle({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Text(
//         title,
//         style: TextStyle(
//             fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
//       ),
//     );
//   }
// }
//
// class WalletListTile extends StatelessWidget {
//   final String title;
//   final String imagePath; // Changed from IconData to String for image path
//
//   const WalletListTile({Key? key, required this.title, required this.imagePath})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.asset(
//         imagePath, // Use Image.asset to display the image
//         width: 24, // Adjust width as needed
//         height: 24, // Adjust height as needed
//       ),
//       title: Text(title),
//       trailing: Radio(
//         value: null,
//         groupValue: null,
//         onChanged: (value) {},
//       ),
//     );
//   }
// }
//
// class OfferBanner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: Colors.green.shade50, // Light green
//         borderRadius: BorderRadius.circular(4.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//               'Get up to Rs.250 cashback for transactions of Rs. 899 and above T&C',
//               style: TextStyle(color: Colors.green.shade700, fontSize: 12)),
//           Text('Add items worth ₹537 to avail the offer',
//               style: TextStyle(color: Colors.green.shade700, fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/SucessPage.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/AddCardScreen.dart';
import 'package:porter_clone/feature/screens/net_BankingSelection.dart';

class PaymentMethodsScreen extends StatefulWidget {
  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String? _selectedWallet;
  String? _selectedUPI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Payment Methods'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Example navigation
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Courier Order Payment'),
                    Text('₹362'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(Icons.local_offer),
                      title: Text('Offers & Coupons available'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  // UPI section
                  SectionTitle(title: 'UPI'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width *
                        0.8, // or any other width you desire
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/image/upi.png', height: 40),
                                SizedBox(width: 8),
                                Text(
                                  'Pay by Any UPI app',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Radio<String>(
                              value: 'upi',
                              groupValue: _selectedUPI,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedUPI = value;
                                });
                              },
                            ), // Circle icon on the right
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Use any UPI app on your phone to pay',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset('assets/image/gpay.png',
                                      height: 40),
                                ), // Replace with your image asset path

                                SizedBox(height: 4),
                                Text('GPay'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset('assets/image/airtel.png',
                                      height: 40),
                                ),
                                SizedBox(height: 4),
                                Text('Airtel'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Other UPI Options',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Debit / Credit Cards section
                  SectionTitle(title: 'Debit / Credit Cards'),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text('Credit / Debit Card'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCardScreen()));
                      },
                    ),
                  ),
                  // Wallets section
                  SectionTitle(title: 'Wallets'),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        WalletListTile(
                            title: "Amazon Pay Balance",
                            imagePath: "assets/image/amazonpay.png",
                            isSelected: _selectedWallet == "Amazon Pay Balance",
                            onChanged: (value) => _handleWalletSelection(
                                value, "Amazon Pay Balance")),
                        WalletListTile(
                            title: "Freecharge",
                            imagePath: "assets/image/freecharge.png",
                            isSelected: _selectedWallet == "Freecharge",
                            onChanged: (value) =>
                                _handleWalletSelection(value, "Freecharge")),
                        WalletListTile(
                            title: "Jiomoney",
                            imagePath: "assets/image/jiomoney.png",
                            isSelected: _selectedWallet == "Jiomoney",
                            onChanged: (value) =>
                                _handleWalletSelection(value, "Jiomoney")),
                        WalletListTile(
                            title: "MobiKwik | ZIP (Pay Later)",
                            imagePath: "assets/image/mobwik.png",
                            isSelected:
                                _selectedWallet == "MobiKwik | ZIP (Pay Later)",
                            onChanged: (value) => _handleWalletSelection(
                                value, "MobiKwik | ZIP (Pay Later)")),
                        OfferBanner(), // Display offer banner

                        WalletListTile(
                            title: "PayZapp",
                            imagePath: "assets/image/payZapp.png",
                            isSelected: _selectedWallet == "PayZapp",
                            onChanged: (value) =>
                                _handleWalletSelection(value, "PayZapp")),

                        WalletListTile(
                            title: "PayPal",
                            imagePath: "assets/image/paypal.png",
                            isSelected: _selectedWallet == "PayPal",
                            onChanged: (value) =>
                                _handleWalletSelection(value, "PayPal")),

                        WalletListTile(
                            title: "PhonePe",
                            imagePath: "assets/image/phonepe.png",
                            isSelected: _selectedWallet == "PhonePe",
                            onChanged: (value) =>
                                _handleWalletSelection(value, "PhonePe")),
                      ],
                    ),
                  ),

                  // Netbanking section
                  SectionTitle(title: 'Netbanking'),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Text('Netbanking'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NetBankSelectionScreen()));
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  // Proceed to Pay button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessPage()));
                      print('Selected UPI: $_selectedUPI');
                      print('Selected Wallet: $_selectedWallet');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Proceed to Pay ₹362',
                          style: TextStyle(fontSize: 18)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.blue[700], // Button color
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleWalletSelection(bool? value, String walletName) {
    setState(() {
      if (value == true) {
        _selectedWallet = walletName;
      } else {
        _selectedWallet = null;
      }
    });
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}

class WalletListTile extends StatelessWidget {
  final String title;
  final String imagePath; // Changed from IconData to String for image path
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;

  const WalletListTile(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.isSelected,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imagePath, // Use Image.asset to display the image
        width: 24, // Adjust width as needed
        height: 24, // Adjust height as needed
      ),
      title: Text(title),
      trailing: Radio<bool>(
        value: true,
        groupValue: isSelected,
        onChanged: onChanged,
      ),
    );
  }
}

class OfferBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.green.shade50, // Light green
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Get up to Rs.250 cashback for transactions of Rs. 899 and above T&C',
              style: TextStyle(color: Colors.green.shade700, fontSize: 12)),
          Text('Add items worth ₹537 to avail the offer',
              style: TextStyle(color: Colors.green.shade700, fontSize: 12)),
        ],
      ),
    );
  }
}
