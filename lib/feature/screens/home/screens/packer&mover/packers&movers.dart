import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/packer&mover/MovingDetails.dart';
import 'package:porter_clone/feature/screens/home/screens/packer&mover/miniTruck.dart';
import 'package:porter_clone/helper/dimension.dart';

class Indexone extends StatefulWidget {
  final String index;
  Indexone({super.key, required this.index});

  @override
  State<Indexone> createState() => _IndexoneState();
}

class _IndexoneState extends State<Indexone> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Packer & Mover'),
  //       actions: [Icon(Icons.arrow_back)],
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(
  //             height: 20,
  //           ),
  //           CarouselSlider(
  //             items: [
  //               _buildBanner('assets/image/banner1.jpg'),
  //               _buildBanner('assets/image/banner2.jpeg'),
  //               _buildBanner('assets/image/banner3.jpeg'),
  //             ],
  //             options: CarouselOptions(
  //               autoPlay: true,
  //               height: 150,
  //               enlargeCenterPage: true,
  //               viewportFraction: 1,
  //               autoPlayInterval: Duration(seconds: 5),
  //             ),
  //           ),
  //
  //           SizedBox(height: MediaQuery.of(context).size.height * 0.02),
  //
  //           Padding(
  //             padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
  //             child: Text(
  //               "Select your shifting needs",
  //               maxLines: 1,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //
  //           SizedBox(height: MediaQuery.of(context).size.height * 0.01),
  //
  //           // Service Selection Cards
  //           _buildServiceCard(
  //             title: "Packing and moving",
  //             subtitle: "Full-fledged house shifting service",
  //             imagePath: "assets/image/packer.png",
  //             onTap: () {},
  //           ),
  //
  //           _buildServiceCard(
  //             title: "Mini truck with 1 labour",
  //             subtitle: "For shifting a few small items",
  //             imagePath: "assets/image/minitruck.png",
  //             onTap: () {},
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Function to create a banner
  Widget _buildBanner(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packer & Mover'),
        actions: [Icon(Icons.arrow_back)],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CarouselSlider(
                items: [
                  _buildBanner('assets/image/banner1.jpg'),
                  _buildBanner('assets/image/banner2.jpeg'),
                  _buildBanner('assets/image/banner3.jpeg'),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  height: 150,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlayInterval: Duration(seconds: 5),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "Select your shiftiing needs",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              _buildServiceCard(
                title: "Packing and moving",
                subtitle: "Full fledged house shifting service",
                imagePath: "assets/image/packer.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => Packers(),
                      builder: (context) => MovingDetailsPage(),
                    ),
                  );
                },
              ),
              _buildServiceCard(
                title: "Mini truck with 1 labour",
                subtitle: "For shifting a few small items",
                imagePath: "assets/image/minitruck.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MiniTruck(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildServiceCard({
  required String title,
  required String subtitle,
  required String imagePath,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left: Service Icon
          Image.asset(
            imagePath,
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),

          SizedBox(width: 5),

          // Middle: Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward_ios,
                      size: 18, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Right: Arrow Icon
        ],
      ),
    ),
  );
}

// Widget _buildServiceCard({
//   required String title,
//   required String subtitle,
//   required String imagePath,
//   required VoidCallback onTap,
// }) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       padding: EdgeInsets.all(16),
//       margin: EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 6,
//             spreadRadius: 2,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Left: Service Icon
//           Image.asset(
//             imagePath,
//             height: 100,
//             width: 150,
//             fit: BoxFit.fill,
//           ),
//
//           SizedBox(width: 5),
//
//           // Middle: Text
//           Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(Icons.arrow_forward_ios,
//                       size: 18, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//
//           // Right: Arrow Icon
//         ],
//       ),
//     ),
//   );
// }
