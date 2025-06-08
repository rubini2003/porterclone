import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0), // Background color from the image
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
          'Add Card',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:
                      MainAxisSize.min, // Important for card to fit content
                  children: [
                    Text(
                      'Card Number',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Card Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: Colors.blue), // Blue border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Thicker blue border when focused
                        ),
                        suffixIcon: Icon(Icons.credit_card, color: Colors.blue),
                      ),
                      keyboardType:
                          TextInputType.number, // For card number input
                    ),
                    SizedBox(height: 19),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiry',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'MM/YY',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                keyboardType:
                                    TextInputType.number, // For expiry input
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CVV',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'CVV',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  suffixIcon: Icon(Icons.help_outline,
                                      color: Colors.grey), // Question mark icon
                                ),
                                keyboardType:
                                    TextInputType.number, // For CVV input
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
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity, // Make button full width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // Blue button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Implement proceed to pay logic
                },
                child: Text(
                  'Proceed to Pay ₹362',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
