import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porter_clone/feature/screens/coins/PorterRewards.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text("Porter Rewards")),
        ),
        // backgroundColor: Colors.blue[200],
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: 150,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF120173),
                          Color(0xFFaa09b3),
                          Color(0xFF9d03a6),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Available Coins',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            top: 20,
                            bottom: 0,
                            right: 0,
                            left: 200,
                            child: Image.asset(
                              "assets/image/coins.png",
                              height: 150,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Coins Transaction History',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Use Coins',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildCoinCard(
                        context,
                        'Transfer into',
                        ' Porter Credits',
                        'assets/image/wallet3d.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PorterRewardsScreen(
                                      name: "Porter Credits")));
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildCoinCard(
                        context,
                        'Transfer into',
                        'Bank Account',
                        'assets/image/bank.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PorterRewardsScreen(
                                      name: "Bank Account")));
                        },
                        isNew: true,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'More about Coins',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildCoinInfoCard(
                        context,
                        'How do I earn coins?',
                        'assets/image/earnmoney.png',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetContent();
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildCoinInfoCard(
                        context,
                        'How do I use coins?',
                        'assets/image/usemoney.png',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetContent1();
                            },
                          );

                          // Add your navigation or other logic here
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  'Frequently asked questions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const FAQItem(question: 'Do Porter coins have validity?'),
              const FAQItem(
                  question: 'What is the value of a Porter coin in Rupees?'),
              const FAQItem(question: 'How can I use Porter coins?'),
              const FAQItem(question: 'When are the Porter coins awarded?'),
              const FAQItem(
                  question:
                      'Will Porter Rewards be credited against a PFE / Business wallet trip?'),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoinCard(
      BuildContext context, String title, String subtitle, String imagePath,
      {VoidCallback? onTap, bool isNew = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  if (isNew)
                    Align(
                      alignment: Alignment.topLeft,
                      child: ClipPath(
                        clipper: RoundedRectangleBannerClipper(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          color: Colors.green.shade100,
                          child: const Text(
                            'NEW 🎉',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(height: 24),
                  if (isNew) const SizedBox(height: 8),
                  Center(
                    child: Image.asset(
                      imagePath,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinInfoCard(
      BuildContext context, String title, String imagePath,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                color: Colors.purple[50],
              ),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Image.asset(
                  imagePath,
                  height: 130,
                  width: 130,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'Learn',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[700],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.blue[700],
                        ),
                      ],
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
}

class FAQItem extends StatefulWidget {
  const FAQItem({Key? key, required this.question}) : super(key: key);

  final String question;

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.grey),
        onExpansionChanged: (bool expanded) {
          setState(() => _isExpanded = expanded);
        },
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Answer to the question goes here. This is a placeholder for the actual answer to the FAQ. You can add more text as needed.',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedRectangleBannerClipper extends CustomClipper<Path> {
  final double borderRadius;

  RoundedRectangleBannerClipper({this.borderRadius = 12.0});

  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at the top-left with a rounded corner
    path.moveTo(borderRadius, 0);
    path.quadraticBezierTo(0, 0, 0, borderRadius);

    // Left side
    path.lineTo(0, size.height - borderRadius);

    // Bottom-left corner (Sharp)
    path.lineTo(0, size.height);

    // Bottom-right corner (Rounded)
    path.lineTo(size.width - borderRadius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - borderRadius);

    // Right side (Sharp)
    path.lineTo(size.width, 0);

    // Top-right corner (Sharp)
    path.lineTo(borderRadius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Reclip only if borderRadius changes
  }
}

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade700,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Crucial for bottom sheet sizing
        children: [
          Text(
            "How to earn coins ?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              dotColor: Colors.white30,
              activeDotColor: Colors.white,
              dotHeight: 8,
              dotWidth: MediaQuery.of(context).size.width / 3.5,
            ),
            onDotClicked: (index) {
              _controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
          Expanded(
            // Use Expanded to allow PageView to grow within Column
            child: PageView(
              controller: _controller,
              children: [
                PageContent(
                  // title: "How to earn coins ?",
                  imageUrl: 'assets/image/earnmoney1.png',
                  description:
                      "Earn 2 coins on every ₹100 spent on Truck or 2-wheeler booking",
                ),
                PageContent(
                  // title: "Page 2 Title",
                  imageUrl: 'assets/image/earnmoney2.png',
                  description:
                      "For Porter Credits: 1Coin = ₹1 \n For Bank Transfer: 1Coin = ₹0.9",
                ),
                PageContent(
                  // title: "Page 3 Title",
                  imageUrl: 'assets/image/earnmoney3.png',
                  description:
                      "Porter Coins expire after 30 days from the date of credit",
                  onElevatedButtonPressed: () {
                    Navigator.pop(context);
                    print('Elevated button pressed');
                  },
                  onTextButtonPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomSheetContent1();
                      },
                    );
                    print('Text button pressed');
                  },
                  elevatedButtonText: 'Understood',
                  textButtonText: 'How to earn coins',
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class BottomSheetContent1 extends StatefulWidget {
  @override
  _BottomSheetContent1State createState() => _BottomSheetContent1State();
}

class _BottomSheetContent1State extends State<BottomSheetContent1> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade700,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Crucial for bottom sheet sizing
        children: [
          Text(
            "How to redeem coins ?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: WormEffect(
              dotColor: Colors.white30,
              activeDotColor: Colors.white,
              dotHeight: 8,
              dotWidth: MediaQuery.of(context).size.width / 3.5,
            ),
            onDotClicked: (index) {
              _controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
          Expanded(
            // Use Expanded to allow PageView to grow within Column
            child: PageView(
              controller: _controller,
              children: [
                PageContent(
                  // title: "How to earn coins ?",
                  imageUrl: 'assets/image/usemoney1.png',
                  description:
                      "A Minimum of 25 coins are required to transfer coins into wallet,bank,and voucher ",
                ),
                PageContent(
                  // title: "Page 2 Title",
                  imageUrl: 'assets/image/earnmoney2.png',
                  description:
                      "For Porter Credits: 1Coin = ₹1 \n For Bank Transfer: 1Coin = ₹0.9",
                ),
                PageContent(
                  imageUrl: 'assets/image/earnmoney3.png',
                  description:
                      "Porter Coins expire after 30 days from the date of credit",
                  onElevatedButtonPressed: () {
                    Navigator.pop(context);
                    print('Elevated button pressed');
                  },
                  onTextButtonPressed: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomSheetContent();
                      },
                    );
                    print('Text button pressed');
                  },
                  elevatedButtonText: 'Understood',
                  textButtonText: 'How to redeem coins',
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final String imageUrl;
  final String description;
  final VoidCallback? onElevatedButtonPressed;
  final VoidCallback? onTextButtonPressed;
  final String? elevatedButtonText;
  final String? textButtonText;

  const PageContent({
    Key? key,
    required this.imageUrl,
    required this.description,
    this.onElevatedButtonPressed,
    this.onTextButtonPressed,
    this.elevatedButtonText,
    this.textButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 16.0),
        Image.asset(
          imageUrl,
          width: 200,
          height: 100,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 40.0), // Added space before buttons

        if (onElevatedButtonPressed != null && elevatedButtonText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: onElevatedButtonPressed,
                child: Text(elevatedButtonText!),
              ),
            ),
          ),

        if (onTextButtonPressed != null && textButtonText != null)
          TextButton(
            onPressed: onTextButtonPressed,
            child: Text(
              textButtonText!,
              style: TextStyle(color: Colors.white), // Keep text white
            ),
          ),
      ],
    );
  }
}

// class PageContent extends StatelessWidget {
//   final String imageUrl;
//   final String description;
//
//   const PageContent({
//     Key? key,
//     required this.imageUrl,
//     required this.description,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(height: 16.0),
//         Image.asset(
//           imageUrl,
//           width: 200,
//           height: 100,
//           fit: BoxFit.contain,
//         ),
//         SizedBox(height: 16.0),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             description,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
