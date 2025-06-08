import 'package:flutter/material.dart';

class SavedAddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Saved Addresses', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.1),
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.add, color: Colors.blue, size: 20),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Add New Address',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Your Saved Addresses',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  AddressCard(
                    title: 'Jdjjd',
                    name: 'Dharma',
                    phone: '9790831260',
                    house: '16',
                    address: 'Kanchipuram, Tamil Nadu, India',
                    pincode: '631501',
                    icon: Icons.favorite,
                  ),
                  AddressCard(
                    title: 'Shop',
                    name: 'Rubini Dharmarajan',
                    phone: '7358177393',
                    house: 'Fhj',
                    address: 'Chennai, Tamil Nadu, India',
                    pincode: '600124',
                    icon: Icons.store,
                  ),
                  AddressCard(
                    title: 'Home',
                    name: 'Meera',
                    phone: '9874563110',
                    house: '',
                    address: 'Mangadu, Chennai, Tamil Nadu, India',
                    pincode: '',
                    icon: Icons.home,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String title;
  final String name;
  final String phone;
  final String house;
  final String address;
  final String pincode;
  final IconData icon;

  AddressCard({
    required this.title,
    required this.name,
    required this.phone,
    required this.house,
    required this.address,
    required this.pincode,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Soft shadow
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black54),
                SizedBox(width: 10),
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 5),
            Text('$name, $phone',
                style: TextStyle(fontSize: 14, color: Colors.black87)),
            SizedBox(height: 5),
            Divider(),
            if (house.isNotEmpty)
              Text('House/Apartment: $house',
                  style: TextStyle(fontSize: 14, color: Colors.black87)),
            Text(address,
                style: TextStyle(fontSize: 14, color: Colors.black87)),
            if (pincode.isNotEmpty)
              Text('Pincode: $pincode',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
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
