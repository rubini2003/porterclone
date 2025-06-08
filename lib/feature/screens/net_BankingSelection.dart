// import 'package:flutter/material.dart';
//
// class NetBankSelectionScreen extends StatefulWidget {
//   const NetBankSelectionScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NetBankSelectionScreen> createState() => _NetBankSelectionScreenState();
// }
//
// class _NetBankSelectionScreenState extends State<NetBankSelectionScreen> {
//   String _searchTerm = '';
//   String? _selectedBank;
//
//   final List<Bank> _bankList = [
//     Bank(name: 'AU Small Finance Bank', logo: 'assets/image/AU_BANK.png'),
//     Bank(name: 'Airtel Payments Bank', logo: 'assets/image/airtel.png'),
//     Bank(name: 'Allahabad Bank', logo: 'assets/image/amazonpay.png'),
//     Bank(name: 'Axis Bank', logo: 'assets/image/axis.png'),
//     Bank(name: 'Bank of Baroda', logo: 'assets/image/bankofbaroda.png'),
//     Bank(name: 'Bank of India', logo: 'assets/image/Bankofindia.png'),
//     Bank(name: 'Bank of Maharashtra', logo: 'assets/image/Bankofmaha.png'),
//     Bank(name: 'Canara Bank', logo: 'assets/image/CanaraBank.png'),
//     Bank(
//         name: 'Canara Bank (e-Syndicate)', logo: 'assets/image/CanaraBank.png'),
//   ];
//
//   List<Bank> get _filteredBankList {
//     if (_searchTerm.isEmpty) {
//       return _bankList;
//     } else {
//       return _bankList
//           .where((bank) =>
//               bank.name.toLowerCase().contains(_searchTerm.toLowerCase()))
//           .toList();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Background color of appbar
//         elevation: 0, // Remove the shadow
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'Netbanking',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: false,
//       ),
//       backgroundColor: Colors.grey[50],
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search banks',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _searchTerm = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 16.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _filteredBankList.length,
//                 itemBuilder: (context, index) {
//                   final bank = _filteredBankList[index];
//                   return Card(
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     margin: const EdgeInsets.symmetric(vertical: 4.0),
//                     child: ListTile(
//                       leading: Image.asset(
//                         bank.logo, // Display the bank's logo
//                         width: 32,
//                         height: 32,
//                       ),
//                       title: Text(bank.name),
//                       trailing: Radio<String>(
//                         value: bank.name,
//                         groupValue: _selectedBank,
//                         onChanged: (String? value) {
//                           setState(() {
//                             _selectedBank = value;
//                           });
//                         },
//                       ),
//                       onTap: () {
//                         setState(() {
//                           _selectedBank = bank.name;
//                         });
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Bank {
//   final String name;
//   final String logo;
//
//   Bank({required this.name, required this.logo});
// }

import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/SucessPage.dart';

class NetBankSelectionScreen extends StatefulWidget {
  const NetBankSelectionScreen({Key? key}) : super(key: key);

  @override
  State<NetBankSelectionScreen> createState() => _NetBankSelectionScreenState();
}

class _NetBankSelectionScreenState extends State<NetBankSelectionScreen> {
  String _searchTerm = '';
  String? _selectedBank;

  final List<Bank> _bankList = [
    Bank(name: 'AU Small Finance Bank', logo: 'assets/image/AU_BANK.png'),
    Bank(name: 'Airtel Payments Bank', logo: 'assets/image/airtel.png'),
    Bank(name: 'Allahabad Bank', logo: 'assets/image/amazonpay.png'),
    Bank(name: 'Axis Bank', logo: 'assets/image/axis.png'),
    Bank(name: 'Bank of Baroda', logo: 'assets/image/bankofbaroda.png'),
    Bank(name: 'Bank of India', logo: 'assets/image/Bankofindia.png'),
    Bank(name: 'Bank of Maharashtra', logo: 'assets/image/Bankofmaha.png'),
    Bank(name: 'Canara Bank', logo: 'assets/image/CanaraBank.png'),
    Bank(
        name: 'Canara Bank (e-Syndicate)', logo: 'assets/image/CanaraBank.png'),
  ];

  List<Bank> get _filteredBankList {
    if (_searchTerm.isEmpty) {
      return _bankList;
    } else {
      return _bankList
          .where((bank) =>
              bank.name.toLowerCase().contains(_searchTerm.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Netbanking',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search banks',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
              onChanged: (value) {
                setState(() {
                  _searchTerm = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredBankList.length,
                itemBuilder: (context, index) {
                  final bank = _filteredBankList[index];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      leading: Image.asset(
                        bank.logo,
                        width: 32,
                        height: 32,
                      ),
                      title: Text(bank.name),
                      trailing: Radio<String>(
                        value: bank.name,
                        groupValue: _selectedBank,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedBank = value;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _selectedBank = bank.name;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: _selectedBank != null
          ? // Conditionally show the button
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessPage()),
                      (Route<dynamic> route) =>
                          false, // This condition always returns false, removing all routes
                    );
                    // You can navigate to the next screen or perform any other action
                  },
                  child: const Text('Proceed'),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}

class Bank {
  final String name;
  final String logo;

  Bank({required this.name, required this.logo});
}
