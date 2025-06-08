import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/Payment_method.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Added background color for visibility
      child: Stack(
        clipBehavior: Clip.none, // Allow positioned items to overflow
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Wrap(
              children: [
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'Before you send make sure',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildImageWithLabel(
                        'assets/image/onebox.jpeg', 'One order = One box'),
                    _buildImageWithLabel(
                        'assets/image/sealing.jpeg', 'Packed properly'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildImageWithLabel('assets/image/overwrite.jpeg',
                        'Write order ID on parcel'),
                    _buildImageWithLabel('assets/image/frangleitems.jpeg',
                        'No restricted items'),
                  ],
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethodsScreen()));
                    },
                    child: Center(
                      child: Text(
                        'Accept & Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -70, // Adjust to position the close button correctly
            right: 170,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageWithLabel(String imagePath, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: 150,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 100,
            width: 130,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
