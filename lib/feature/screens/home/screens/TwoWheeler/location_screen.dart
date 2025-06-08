// // import 'package:flutter/material.dart';
// //
// // class TwoWheelerHome extends StatefulWidget {
// //   @override
// //   _TwoWheelerHomeState createState() => _TwoWheelerHomeState();
// // }
// //
// // class _TwoWheelerHomeState extends State<TwoWheelerHome> {
// //   final TextEditingController _dropLocationController = TextEditingController();
// //   TextEditingController _pickupLocationController = TextEditingController();
// //   bool isPickedUp = false;
// //   String? _countryDialCode;
// //
// //   @override
// //   void dispose() {
// //     _dropLocationController.dispose();
// //     _pickupLocationController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   void initState() {
// //     _pickupLocationController.text = "Rubini";
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () {},
// //         ),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         borderRadius: BorderRadius.circular(10),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.grey.withOpacity(0.2),
// //                             spreadRadius: 1,
// //                             blurRadius: 5,
// //                             offset: Offset(0, 3),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Row(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Column(
// //                               children: [
// //                                 Container(
// //                                   width: 8,
// //                                   height: 8,
// //                                   decoration: BoxDecoration(
// //                                     color: Colors.green,
// //                                     shape: BoxShape.circle,
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                   width: 1,
// //                                   height: 80,
// //                                   color: Colors.grey.shade400,
// //                                 ),
// //                                 Container(
// //                                   width: 8,
// //                                   height: 8,
// //                                   decoration: BoxDecoration(
// //                                     color: Colors.red,
// //                                     shape: BoxShape.circle,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                             SizedBox(width: 10),
// //                             Expanded(
// //                               child: Column(
// //                                 children: [
// //                                   TextFormField(
// //                                     controller: _pickupLocationController,
// //                                     maxLines: 2,
// //                                     decoration: InputDecoration(
// //                                       hintStyle: TextStyle(
// //                                         fontSize: 16,
// //                                         fontWeight: FontWeight.w500,
// //                                       ),
// //                                       suffixIcon: Icon(Icons.chevron_right),
// //                                       border: OutlineInputBorder(
// //                                         borderRadius: BorderRadius.circular(5),
// //                                         borderSide: BorderSide.none,
// //                                       ),
// //                                       filled: true,
// //                                       fillColor: Colors.grey.shade50,
// //                                       contentPadding: EdgeInsets.all(12),
// //                                     ),
// //                                   ),
// //                                   SizedBox(height: 8),
// //                                   // TypeAheadField<PredictionModel>(
// //                                   //   textFieldConfiguration:
// //                                   //       TextFieldConfiguration(
// //                                   //     controller: _dropLocationController,
// //                                   //     textInputAction: TextInputAction.search,
// //                                   //     textCapitalization:
// //                                   //         TextCapitalization.words,
// //                                   //     keyboardType: TextInputType.streetAddress,
// //                                   //     decoration: InputDecoration(
// //                                   //       hintText: "Where is your Drop?".tr,
// //                                   //       hintStyle: TextStyle(
// //                                   //         fontSize: 16,
// //                                   //         fontWeight: FontWeight.w400,
// //                                   //         color: Colors.grey.shade600,
// //                                   //       ),
// //                                   //       suffixIcon: Icon(Icons.mic),
// //                                   //       border: OutlineInputBorder(
// //                                   //         borderRadius:
// //                                   //             BorderRadius.circular(10),
// //                                   //         borderSide: BorderSide.none,
// //                                   //       ),
// //                                   //       filled: true,
// //                                   //       fillColor: Colors.grey.shade50,
// //                                   //       contentPadding: EdgeInsets.all(12),
// //                                   //     ),
// //                                   //     style: Theme.of(context)
// //                                   //         .textTheme
// //                                   //         .displayMedium!
// //                                   //         .copyWith(
// //                                   //           color: Theme.of(context)
// //                                   //               .textTheme
// //                                   //               .bodyLarge!
// //                                   //               .color,
// //                                   //           fontSize: Dimensions.fontSizeLarge,
// //                                   //         ),
// //                                   //   ),
// //                                   //   suggestionsCallback: (pattern) async {
// //                                   //     return await Get.find<
// //                                   //             LocationController>()
// //                                   //         .searchLocation(context, pattern);
// //                                   //   },
// //                                   //   itemBuilder:
// //                                   //       (context, PredictionModel suggestion) {
// //                                   //     return Padding(
// //                                   //       padding: const EdgeInsets.all(
// //                                   //           Dimensions.paddingSizeSmall),
// //                                   //       child: Row(children: [
// //                                   //         const Icon(Icons.location_on),
// //                                   //         Expanded(
// //                                   //           child: Text(suggestion.description!,
// //                                   //               maxLines: 1,
// //                                   //               overflow: TextOverflow.ellipsis,
// //                                   //               style: Theme.of(context)
// //                                   //                   .textTheme
// //                                   //                   .displayMedium!
// //                                   //                   .copyWith(
// //                                   //                     color: Theme.of(context)
// //                                   //                         .textTheme
// //                                   //                         .bodyLarge!
// //                                   //                         .color,
// //                                   //                     fontSize: Dimensions
// //                                   //                         .fontSizeLarge,
// //                                   //                   )),
// //                                   //         ),
// //                                   //       ]),
// //                                   //     );
// //                                   //   },
// //                                   //   onSuggestionSelected: _onSuggestionSelected,
// //                                   // ),
// //                                   Padding(
// //                                     padding: const EdgeInsets.only(top: 5),
// //                                     child: Text(
// //                                       'Type at least 4 characters to start searching',
// //                                       style: TextStyle(
// //                                           color: Colors.grey.shade700),
// //                                     ),
// //                                   )
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 10),
// //                     ElevatedButton.icon(
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.white,
// //                         elevation: 0,
// //                       ),
// //                       onPressed: () {},
// //                       icon: Icon(Icons.add, color: Colors.blue),
// //                       label: Text(
// //                         "ADD STOP",
// //                         style: TextStyle(color: Colors.blue),
// //                       ),
// //                     ),
// //                     Divider(height: 1, color: Colors.grey.shade300),
// //                     ListTile(
// //                       leading: Icon(Icons.favorite),
// //                       title: Text("Saved Addresses"),
// //                       trailing: Icon(Icons.chevron_right),
// //                     ),
// //                     Divider(height: 1, color: Colors.grey.shade300),
// //                     Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: Align(
// //                         alignment: Alignment.centerLeft,
// //                         child: Text(
// //                           "Recent drops",
// //                           style: TextStyle(color: Colors.grey.shade700),
// //                         ),
// //                       ),
// //                     ),
// //                     ListTile(
// //                       leading: Icon(Icons.access_time),
// //                       title: Text("Poonamallee bus stand"),
// //                       subtitle: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                               "Poonamallee - Avadi High Road, Muthu Kumaran..."),
// //                           Row(
// //                             children: [
// //                               Text("Rubini Dharm... • "),
// //                               Text("7358177393"),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                       trailing: Text("Save"),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 20),
// //           Container(
// //             width: double.infinity,
// //             alignment: Alignment.center,
// //             padding: EdgeInsets.all(16),
// //             decoration: BoxDecoration(
// //               border: Border(top: BorderSide(color: Colors.grey.shade300)),
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Icon(Icons.location_on, color: Colors.blue),
// //                 SizedBox(width: 5),
// //                 Text(
// //                   "Locate on the Map",
// //                   style: TextStyle(color: Colors.blue),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/Deliveryscreen.dart';
//
// class TwoWheelerHome extends StatefulWidget {
//   @override
//   _TwoWheelerHomeState createState() => _TwoWheelerHomeState();
// }
//
// class _TwoWheelerHomeState extends State<TwoWheelerHome> {
//   final TextEditingController _dropLocationController = TextEditingController();
//   final TextEditingController _pickupLocationController =
//       TextEditingController();
//   bool isPickedUp = false;
//   String? _countryDialCode;
//
//   @override
//   void initState() {
//     super.initState();
//     _pickupLocationController.text = "RubiniDharmarajan ";
//   }
//
//   // Future<void> _loadInitialData() async {
//   //   await _loadUserInfo();
//   // }
//
//   // Future<void> _loadUserInfo() async {
//   //   if (AuthHelper.isLoggedIn()) {
//   //     try {
//   //       await Get.find<ProfileController>().getUserInfo();
//   //       UserInfoModel? userInfo = Get.find<ProfileController>().userInfoModel;
//   //       AddressModel? pickupAddress =
//   //           AddressHelper.getUserAddressFromSharedPref();
//   //
//   //       if (userInfo != null) {
//   //         setState(() {
//   //           String userInfoText =
//   //               '${userInfo.fName ?? ""} ${userInfo.lName ?? ""} • ${userInfo.phone ?? ""}';
//   //           if (pickupAddress != null) {
//   //             userInfoText += '\n${pickupAddress.address ?? ""}';
//   //           }
//   //           _pickupLocationController.text = userInfoText;
//   //         });
//   //
//   //         // Set pickup address to ParcelController
//   //         if (pickupAddress != null) {
//   //           Get.find<ParcelController>().setPickupAddress(pickupAddress, false);
//   //         }
//   //       } else {
//   //         print("User information is null");
//   //       }
//   //     } catch (e) {
//   //       print("Error loading user info: $e"); // Proper error handling
//   //     }
//   //   } else {
//   //     print("User not logged in");
//   //   }
//   // }
//
//   @override
//   void dispose() {
//     _dropLocationController.dispose();
//     _pickupLocationController.dispose();
//     super.dispose();
//   }
//   //
//   // void _onSuggestionSelected(PredictionModel suggestion) {
//   //   Get.find<ParcelController>().setLocationFromPlace(
//   //     suggestion.placeId,
//   //     suggestion.description,
//   //     isPickedUp,
//   //   );
//   //   _dropLocationController.text = suggestion.description!;
//   //   FocusScope.of(context).unfocus();
//   //   print('placing ide ${suggestion.placeId}');
//   //   Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) =>
//   //             DeliveryScreen(placeId: suggestion.placeId ?? ""),
//   //       ));
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 // Pickup Location
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         spreadRadius: 1,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               width: 8,
//                               height: 8,
//                               decoration: BoxDecoration(
//                                 color: Colors.green,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             Container(
//                               width: 1,
//                               height: 80,
//                               color: Colors.grey.shade400,
//                             ),
//                             Container(
//                               width: 8,
//                               height: 8,
//                               decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               TextFormField(
//                                 controller: _pickupLocationController,
//                                 maxLines: 2,
//                                 readOnly: true,
//                                 decoration: InputDecoration(
//                                   hintStyle: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   suffixIcon: Icon(Icons.chevron_right),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(5),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.grey.shade50,
//                                   contentPadding: EdgeInsets.all(12),
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               // Drop Location
//                               // TypeAheadField<PredictionModel>(
//                               //   textFieldConfiguration: TextFieldConfiguration(
//                               //     controller: _dropLocationController,
//                               //     textInputAction: TextInputAction.search,
//                               //     textCapitalization:
//                               //     TextCapitalization.words,
//                               //     keyboardType: TextInputType.streetAddress,
//                               //     decoration: InputDecoration(
//                               //       hintText:
//                               //       "Type at least 4 characters to start searching",
//                               //       hintStyle: TextStyle(
//                               //         fontSize: 16,
//                               //         fontWeight: FontWeight.w400,
//                               //         color: Colors.grey.shade600,
//                               //       ),
//                               //       suffixIcon: Row(
//                               //         mainAxisAlignment:
//                               //         MainAxisAlignment.end,
//                               //         mainAxisSize: MainAxisSize.min,
//                               //         children: [
//                               //           IconButton(
//                               //             icon: Icon(Icons.close),
//                               //             onPressed: () {
//                               //               _dropLocationController.clear();
//                               //             },
//                               //           ),
//                               //           Icon(Icons.mic),
//                               //         ],
//                               //       ),
//                               //       border: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(10),
//                               //         borderSide: BorderSide.none,
//                               //       ),
//                               //       filled: true,
//                               //       fillColor: Colors.grey.shade50,
//                               //       contentPadding: EdgeInsets.all(12),
//                               //     ),
//                               //     style: Theme.of(context)
//                               //         .textTheme
//                               //         .displayMedium!
//                               //         .copyWith(
//                               //       color: Theme.of(context)
//                               //           .textTheme
//                               //           .bodyLarge!
//                               //           .color,
//                               //       fontSize: Dimensions.fontSizeLarge,
//                               //     ),
//                               //   ),
//                               //   suggestionsCallback: (pattern) async {
//                               //     return await Get.find<LocationController>()
//                               //         .searchLocation(context, pattern);
//                               //   },
//                               //   itemBuilder:
//                               //       (context, PredictionModel suggestion) {
//                               //     return Padding(
//                               //       padding: const EdgeInsets.all(
//                               //           Dimensions.paddingSizeSmall),
//                               //       child: Row(children: [
//                               //         const Icon(Icons.location_on),
//                               //         Expanded(
//                               //           child: Text(suggestion.description!,
//                               //               maxLines: 1,
//                               //               overflow: TextOverflow.ellipsis,
//                               //               style: Theme.of(context)
//                               //                   .textTheme
//                               //                   .displayMedium!
//                               //                   .copyWith(
//                               //                 color: Theme.of(context)
//                               //                     .textTheme
//                               //                     .bodyLarge!
//                               //                     .color,
//                               //                 fontSize:
//                               //                 Dimensions.fontSizeLarge,
//                               //               )),
//                               //         ),
//                               //       ]),
//                               //     );
//                               //   },
//                               //   onSuggestionSelected: _onSuggestionSelected,
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 10),
//
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     elevation: 0,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DeliveryScreen(),
//                         ));
//                   },
//                   icon: Icon(Icons.add, color: Colors.blue),
//                   label: Text(
//                     "ADD STOP",
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Saved Addresses
//           Divider(height: 1, color: Colors.grey.shade300),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text("Saved Addresses"),
//             trailing: Icon(Icons.chevron_right),
//           ),
//
// Recent Drops
// Divider(height: 1, color: Colors.grey.shade300),
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Align(
//     alignment: Alignment.centerLeft,
//     child: Text(
//       "Recent drops",
//       style: TextStyle(color: Colors.grey.shade700),
//     ),
//   ),
// ),
// ListTile(
//   leading: Icon(Icons.access_time),
//   title: Text("Poonamallee bus stand"),
//   subtitle: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text("Poonamallee - Avadi High Road, Muthu Kumaran..."),
//       Row(
//         children: [
//           Text("Rubini Dharm... • "),
//           Text("7358177393"),
//         ],
//       ),
//     ],
//   ),
//   trailing: Text("Save"),
// ),
//
//           Spacer(),
//
//           // Locate on Map Button
//           Container(
//             width: double.infinity,
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               border: Border(top: BorderSide(color: Colors.grey.shade300)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.location_on, color: Colors.blue),
//                 SizedBox(width: 5),
//                 Text(
//                   "Use current location",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 Text('   |   '),
//                 Icon(Icons.location_on, color: Colors.blue),
//                 SizedBox(width: 5),
//                 Text(
//                   "Locate on the Map",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/AddStopScreen.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/Deliveryscreen.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/pickup_drop_editscreen.dart';

class TwoWheelerHome extends StatefulWidget {
  const TwoWheelerHome({Key? key}) : super(key: key);

  @override
  State<TwoWheelerHome> createState() => _TwoWheelerHomeState();
}

class _TwoWheelerHomeState extends State<TwoWheelerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: LayoutBuilder(//Use LayoutBuilder to get the height
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pickup Location
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 35,
                                    // color: Colors.grey.withOpacity(0.4),
                                    child: CustomPaint(
                                      painter: DottedLinePainter(),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 35,
                                    // color: Colors.grey.withOpacity(0.4),
                                    child: CustomPaint(
                                      painter: DottedLinePainter(),
                                    ),
                                  ),
                                  const Icon(
                                    Icons
                                        .location_on, // Replaced circle with location icon
                                    color: Colors.red,
                                    size: 16, // Adjust size as needed
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PickupLocationScreen(
                                                        location: "pickup")));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.2)),
                                        ),
                                        child: ListTile(
                                          title: const Text(
                                            "Rubini Dharmarajan • 7358177393",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          subtitle: const Text(
                                            "Nazarathpettai, Tamil Nadu 600123, In...",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                          trailing:
                                              const Icon(Icons.chevron_right),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                          dense: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DeliveryScreen(
                                                    location: "Drop"),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.2)),
                                        ),
                                        child: IgnorePointer(
                                          // Prevents keyboard from opening
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "Where is your Drop?",
                                              border: InputBorder.none,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 12),
                                              suffixIcon: IconButton(
                                                icon: const Icon(Icons.mic),
                                                onPressed: () {},
                                              ),
                                            ),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               DeliveryScreen(),
                                    //         ));
                                    //   },
                                    //   child: Container(
                                    //     decoration: BoxDecoration(
                                    //       color: Colors.white,
                                    //       borderRadius: BorderRadius.circular(8),
                                    //       border: Border.all(
                                    //           color: Colors.grey.withOpacity(0.2)),
                                    //     ),
                                    //     child: TextField(
                                    //       decoration: InputDecoration(
                                    //         hintText: "Where is your Drop?",
                                    //         border: InputBorder.none,
                                    //         contentPadding:
                                    //             const EdgeInsets.symmetric(
                                    //                 horizontal: 16, vertical: 12),
                                    //         suffixIcon: IconButton(
                                    //           icon: const Icon(Icons.mic),
                                    //           onPressed: () {},
                                    //         ),
                                    //       ),
                                    //       style: TextStyle(fontSize: 14),
                                    //     ),
                                    //   ),
                                    // ),
                                    const SizedBox(height: 4),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Type at least 4 characters to start searching",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddStopScreen()));
                              },
                              icon: Icon(Icons.add_circle,
                                  color: Colors.blue[700]),
                              label: Text(
                                "ADD STOP",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: const Icon(Icons.favorite_border),
                      title: const Text("Saved Addresses",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Divider(height: 1, color: Colors.grey.shade300),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Recent drops",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.access_time),
                          title: Text("Poonamallee bus stand"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Poonamallee - Avadi High Road, Muthu Kumaran..."),
                              Row(
                                children: [
                                  Text("Rubini Dharm... • "),
                                  Text("7358177393"),
                                ],
                              ),
                            ],
                          ),
                          trailing: Column(
                            children: [
                              Icon(Icons
                                  .favorite_border), // Corrected Icon usage
                              Text("Save")
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text("Recent drops",
                          //       style: TextStyle(fontSize: 16, color: Colors.grey)),
                          // ),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ListTile(
                          //     leading: const Icon(Icons.access_time),
                          //     title: const Text("Poonamallee bus stand",
                          //         style: TextStyle(fontWeight: FontWeight.w500)),
                          //     subtitle: const Text(
                          //       "Poonamallee - Avadi High Road, Muthu Kumaran ...\nRubini Dharm... • 7358177393",
                          //       style: TextStyle(fontSize: 12, color: Colors.grey),
                          //     ),
                          //     trailing: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         IconButton(
                          //           onPressed: () {},
                          //           icon: const Icon(Icons.favorite_border),
                          //           tooltip: "Save",
                          //         ),
                          //         const Text("Save", style: TextStyle(fontSize: 12)),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DeliveryScreen(location: "Drop")));
                      },
                      icon: const Icon(Icons.location_on, color: Colors.blue),
                      label: const Text(
                        "Locate on the Map",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double dashHeight = 3;
    double dashSpace = 3;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
