// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:porter_clone/feature/screens/accounts/ChangeLanguage.dart';
// import 'package:porter_clone/feature/screens/accounts/HelpandSupportScreen.dart';
// import 'package:porter_clone/feature/screens/accounts/SavedAddressScreen.dart';
//
// class MenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200], // Off-white background
//       appBar: null,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 36),
//                             Text(
//                               'Rubini Dharmarajan',
//                               style: TextStyle(
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               'rubinidharmarajan@gmail.com',
//                               style: TextStyle(
//                                   fontSize: 14.0, color: Colors.grey[600]),
//                             ),
//                             Text(
//                               'Verify Email ID',
//                               style:
//                                   TextStyle(fontSize: 14.0, color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Edit Profile',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     height: 70,
//                     width: double.infinity,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue[50],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Add GST Details',
//                             style: TextStyle(color: Colors.blue[800]),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 6),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   _buildCardTile(
//                     icon: Icons.favorite_border,
//                     title: 'Saved Addresses',
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SavedAddressesScreen()));
//                     },
//                   ),
//                   SizedBox(height: 16),
//
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Text(
//                       'Benefits',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       children: [
//                         _buildCardTile(
//                           icon: Icons.star_border,
//                           title: 'Porter Rewards',
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.yellow[100],
//                                 radius: 10,
//                                 child: Icon(Icons.star,
//                                     color: Colors.amber, size: 12),
//                               ),
//                               SizedBox(width: 4),
//                               Text('0'),
//                               Icon(Icons.chevron_right),
//                             ],
//                           ),
//                           onTap: () {},
//                         ),
//                         _buildCardTile(
//                           icon: Icons.card_giftcard,
//                           title: 'Refer your friends!',
//                           trailing: ElevatedButton.icon(
//                             onPressed: () {},
//                             icon: Icon(Icons.share, size: 16),
//                             label: Text('Invite'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue[50],
//                               foregroundColor: Colors.blue,
//                               elevation: 0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 12, vertical: 8),
//                             ),
//                           ),
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 16),
//
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Text(
//                       'Support & Legal',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       children: [
//                         _buildCardTile(
//                           icon: Icons.help_outline,
//                           title: 'Help & Support',
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         HelpAndSupportScreen()));
//                           },
//                         ),
//                         _buildCardTile(
//                           icon: Icons.list_alt,
//                           title: 'Terms and Conditions',
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 16),
//
//                   // Settings Section
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Text(
//                       'Settings',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(
//                       children: [
//                         _buildCardTile(
//                           icon: Icons.language,
//                           title: 'Choose Language',
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         LanguageSelectionScreen()));
//                           },
//                         ),
//                         _buildCardTile(
//                           icon: Icons.logout,
//                           title: 'Logout',
//                           onTap: () {},
//                         ),
//                       ],
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
//
//   Widget _buildCardTile(
//       {required IconData icon,
//       required String title,
//       Widget? trailing,
//       required VoidCallback onTap}) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       color: Colors.white,
//       child: ListTile(
//         leading: Icon(icon, color: Colors.blue[600]),
//         title: Text(title),
//         trailing: trailing ?? Icon(Icons.chevron_right),
//         onTap: onTap,
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/LoginScreens/Signin_screen.dart';
import 'package:porter_clone/feature/screens/accounts/ChangeLanguage.dart';
import 'package:porter_clone/feature/screens/accounts/EditProfileScreen.dart';
import 'package:porter_clone/feature/screens/accounts/HelpandSupportScreen.dart';
import 'package:porter_clone/feature/screens/accounts/SavedAddressScreen.dart';
import 'package:porter_clone/feature/screens/accounts/Termsandconditions.dart';
import 'package:porter_clone/feature/screens/coins/CoinhomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: null,
      body: Column(
        // Changed from SingleChildScrollView to Column
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Non-scrollable section
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 36),
                          Text(
                            'Rubini Dharmarajan',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'rubinidharmarajan@gmail.com',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey[600]),
                          ),
                          Text(
                            'Verify Email ID',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen()));
                      },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Center(
                        child: Text(
                          'Add GST Details',
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),

          // Scrollable section
          Expanded(
            // Wrap scrollable content with Expanded
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildCardTile(
                      icon: Icons.favorite_border,
                      title: 'Saved Addresses',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedAddressesScreen()));
                      },
                    ),
                    SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Benefits',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          _buildCardTile(
                            icon: Icons.star_border,
                            title: 'Porter Rewards',
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.yellow[100],
                                  radius: 10,
                                  child: Icon(Icons.star,
                                      color: Colors.amber, size: 12),
                                ),
                                SizedBox(width: 4),
                                Text('0'),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoinsScreen()));
                            },
                          ),
                          _buildCardTile(
                            icon: Icons.card_giftcard,
                            title: 'Refer your friends!',
                            trailing: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.share, size: 16),
                              label: Text('Invite'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[50],
                                foregroundColor: Colors.blue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Support & Legal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          _buildCardTile(
                            icon: Icons.help_outline,
                            title: 'Help & Support',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HelpAndSupportScreen()));
                            },
                          ),
                          _buildCardTile(
                            icon: Icons.list_alt,
                            title: 'Terms and Conditions',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TermsAndConditionsScreen()));
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    // Settings Section
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          _buildCardTile(
                            icon: Icons.language,
                            title: 'Choose Language',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LanguageSelectionScreen()));
                            },
                          ),
                          _buildCardTile(
                            icon: Icons.logout,
                            title: 'Logout',
                            onTap: () {
                              _showLogoutBottomSheet(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.blue[700]),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('isLogin', false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SigninScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardTile(
      {required IconData icon,
      required String title,
      Widget? trailing,
      required VoidCallback onTap}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[600]),
        title: Text(title),
        trailing: trailing ?? Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
