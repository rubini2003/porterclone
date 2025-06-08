import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/coins/CoinhomeScreen.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/location_screen.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/indexTwo.dart';
import 'package:porter_clone/helper/dimension.dart';
import 'package:porter_clone/helper/responsive_helper.dart';

import 'packer&mover/packers&movers.dart';

class ParcelCategoryScreen extends StatelessWidget {
  const ParcelCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: ResponsiveHelper.isDesktop(context)
          ? null
          : AppBar(
              title: const Text("Parcel Category"),
            ), // Replace ParcelAppBarWidget if not available
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context)
            ? 0
            : Dimensions.paddingSizeLarge),
        child: SizedBox(
          width: Dimensions.webMaxWidth,
          child: Column(
            crossAxisAlignment: ResponsiveHelper.isDesktop(context)
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CoinsScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade700, Colors.purple.shade300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Icon(Icons.location_on, color: Colors.white),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Explore Rewards",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Earn 2 coins for every 100 spent",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: ResponsiveHelper.isDesktop(context)
                      ? Dimensions.paddingSizeExtraLarge
                      : Dimensions.paddingSizeLarge),

              Text(
                'Book Porter for',
                style: TextStyle(fontSize: Dimensions.fontSizeLarge),
              ),
              // Text(
              //   'ready_to_send_something_special'.tr,
              //   style: robotoRegular.copyWith(
              //       color: Theme.of(context).disabledColor),
              // ),
              const SizedBox(height: Dimensions.paddingSizeLarge),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 160.0,
                ),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  final categoryData = [
                    {
                      'title': 'Trucks',
                      'subtitle': 'Choose from our fleet',
                      'image': 'assets/image/truck.jpg',
                    },
                    {
                      'title': '2 Wheeler',
                      'subtitle': 'for smaller goods',
                      'image': 'assets/image/twowheeler.jpg',
                    },
                    {
                      'title': 'Packers & \n Movers',
                      'subtitle': '',
                      'image': 'assets/image/packer.jpg',
                    },
                    {
                      'title': 'All India \n Parcel',
                      'subtitle': '',
                      'image': 'assets/image/India.jpg',
                    },
                  ];

                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        showServiceBottomSheet(context, index);
                      } else if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TwoWheelerHome()));
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Indexone(index: '$index'),
                          ),
                        );
                      } else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SendPackageScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            categoryData[index]['image']!,
                            height: 90,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                // Ensures text takes available space and does not push into arrow icon
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      categoryData[index]['title']!,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    if (categoryData[index]['subtitle'] !=
                                            null &&
                                        categoryData[index]['subtitle']!
                                            .isNotEmpty)
                                      Text(
                                        categoryData[index]['subtitle']!,
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Ensures spacing between text and arrow icon
                              Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Icon(Icons.arrow_forward,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           categoryData[index]['title']!,
                          //           style: const TextStyle(
                          //             fontSize: 14.0,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //         if (categoryData[index]['subtitle'] != null &&
                          //             categoryData[index]['subtitle']!
                          //                 .isNotEmpty)
                          //           Text(
                          //             categoryData[index]['subtitle']!,
                          //             style: const TextStyle(
                          //               fontSize: 10.0,
                          //               color: Colors.grey,
                          //             ),
                          //           ),
                          //       ],
                          //     ),
                          //     Align(
                          //       alignment: Alignment.bottomRight,
                          //       child: Column(
                          //         children: [
                          //           SizedBox(
                          //             height: 20,
                          //           ),
                          //           Container(
                          //             height: 20,
                          //             width:
                          //                 40, // Add a width to the Container to control its size
                          //             decoration: BoxDecoration(
                          //               color: Colors.grey[300],
                          //               borderRadius:
                          //                   BorderRadius.circular(10.0),
                          //             ),
                          //             child: FittedBox(
                          //               // Use FittedBox to scale the icon to fit within the container
                          //               fit: BoxFit
                          //                   .contain, // BoxFit.contain ensures the entire icon is visible
                          //               child: Icon(Icons.arrow_forward,
                          //                   color: Colors.black),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(
                height: 50,
              ),
              SizedBox(height: ResponsiveHelper.isDesktop(context) ? 0 : 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Delivery hai?",
                    style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: Dimensions.fontSizeLarge * 2.5)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Ho Jayega!",
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Dimensions.fontSizeLarge * 2.5)),
              ),
              Column(
                children: [
                  Image.asset("assets/image/porter2.png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showServiceBottomSheet(BuildContext context, int index) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Choose your service",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: robotoMedium.copyWith( // Make sure robotoMedium is defined and accessible!
                  //     fontSize: Dimensions.fontSizeLarge),  // Make sure Dimensions is defined and accessible!
                  style: const TextStyle(
                      // Added placeholder
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Get.toNamed(RouteHelper.getParcelLocationRoute(  // Make sure RouteHelper is defined and accessible!
                  //   parcelController
                  //       .parcelCategoryList![index],  // Make sure parcelController is defined and accessible!
                  // ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TwoWheelerHome()));
                  print("Navigate to local parcel location with index: $index");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8.0), // Use padding here
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Image.asset("assets/image/local.png",
                                    height: 70, width: 100),
                              ),
                              Positioned(
                                top: 20,
                                left: 20,
                                child: Image.asset("assets/image/porter.png",
                                    height: 60, width: 60),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Local",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // style: robotoMedium,  // Make sure robotoMedium is defined and accessible!
                                style: const TextStyle(
                                    fontWeight:
                                        FontWeight.w500), // Added placeholder
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Outstation Service
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TwoWheelerHome()));
                  // Get.toNamed(RouteHelper.getParcelLocationRoute(  // Make sure RouteHelper is defined and accessible!
                  //   parcelController
                  //       .parcelCategoryList![index],  // Make sure parcelController is defined and accessible!
                  // ));
                  // Placeholder
                  print(
                      "Navigate to outstation parcel location with index: $index");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Image.asset(
                                    "assets/image/outstation.png",
                                    height: 70,
                                    width: 100),
                              ),
                              Positioned(
                                top: 20,
                                left: 20,
                                child: Image.asset("assets/image/porter.png",
                                    height: 60, width: 60),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Outstation",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // style: robotoMedium,  // Make sure robotoMedium is defined and accessible!
                                style: const TextStyle(
                                    fontWeight:
                                        FontWeight.w500), // Added placeholder
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.green),
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
        ),
      );
    },
  );
}
