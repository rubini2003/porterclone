import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/accounts/menuScreen.dart';
import 'package:porter_clone/feature/screens/coins/CoinhomeScreen.dart';
import 'package:porter_clone/feature/screens/home/screens/payment/PaymentScreen.dart';
import 'package:porter_clone/feature/screens/orders/order_screen.dart';

import '../home/screens/homescreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _screens = [
    ParcelCategoryScreen(),
    OrderScreen(),
    PaymentScreen(),
    MenuScreen(),
  ];

  // Method to change index when tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures all 5 items are visible
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // Show labels even when unselected
        items: [
          // Changed to use .of(context) for correct colors in selected/unselected states
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/image/orders.png'),
                color:
                    null, //  This prevents the BottomNavigationBar from tinting the icon.
              ),
              label: 'Orders'),
          // BottomNavigationBarItem(
          //   icon: ImageIcon(
          //     const AssetImage('assets/image/wallet.png'),
          //     color:
          //         null, //  This prevents the BottomNavigationBar from tinting the icon.
          //   ),
          //   label: 'Coins',
          // ),
          const BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/image/wallet.png'),
                color:
                    null, //  This prevents the BottomNavigationBar from tinting the icon.
              ),
              label: 'Payment'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
