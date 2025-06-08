import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/SucessPage.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int currentStep = 3;
  DateTime? _selectedDate;
  String _selectedTimeSlot = '7:00 - 8:00';

  final List<String> stepTitles = [
    "Moving details",
    "Add items",
    "Add ons",
    "Review"
  ];

  final List<IconData> stepIcons = [
    Icons.check,
    Icons.inventory_2,
    Icons.grid_view,
    Icons.receipt,
  ];
  void _updateShiftingDetails(DateTime? date, String timeSlot) {
    setState(() {
      _selectedDate = date;
      _selectedTimeSlot = timeSlot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Packers & Movers")),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(stepTitles.length, (index) {
                    return Row(
                      children: [
                        _buildStep(index),
                        if (index < stepTitles.length - 1) _buildDottedLine(),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Moving details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                LocationTile(
                  icon: CupertinoIcons.arrow_up_circle_fill,
                  kolor: Colors.green,
                  locationText: "Pickup location",
                  address: "332V+P9H, 6, Poonamallee - Avadi Hi...",
                ),
                SizedBox(
                  height: 30,
                ),
                LocationTile(
                  icon: CupertinoIcons.arrow_down_circle_fill,
                  kolor: Colors.red,
                  locationText: "Drop location",
                  address: "Kanchipuram, Tamil Nadu 631501, India",
                ),
                ListTile(
                  title: const Text(
                    "1 item added",
                    style: TextStyle(color: Colors.black87),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 20, color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                const Divider(height: 1, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black, // Or any color you want
                        width: 1.0, // Or any width you want
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const Icon(Icons.local_offer, color: Colors.green),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter referral or coupon code",
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                  color: Colors.black87), // Add a color here
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Apply",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(height: 1, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Payment summary",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                PaymentRow(title: "Quoted amount", amount: "₹2,280"),
                PaymentRow(title: "Total amount to be paid", amount: "₹2,280"),
              ],
            ),
            Positioned(
              top: 179,
              left: 28,
              height: 100, // Adjust height as needed
              child: CustomPaint(
                size: Size(1, 100), // 1 pixel wide, adjust height
                painter: DottedLinePainter(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      // Padding(
      //   padding:
      //       const EdgeInsets.all(8.0), // Add some padding around the content
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           children: [
      //             const Icon(Icons.calendar_today),
      //             const SizedBox(width: 8),
      //             const Text('Shifting on 28 Mar, 7:00 AM - 8:00 AM',
      //                 style: TextStyle(fontSize: 14)),
      //             const Spacer(),
      //             IconButton(
      //               icon: Icon(
      //                 Icons.edit,
      //                 color: Colors.blue[700],
      //               ),
      //               onPressed: () {
      //                 _showMyBottomSheet(context);
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Center(
      //         child: SizedBox(
      //           width: MediaQuery.of(context).size.width * 0.9,
      //           child: ElevatedButton(
      //             style: ElevatedButton.styleFrom(
      //               backgroundColor: Colors.blue[700],
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10)),
      //               padding: const EdgeInsets.symmetric(vertical: 14),
      //             ),
      //             onPressed: () {
      //               // Handle proceed to pay action
      //             },
      //             child: const Text(
      //               'Proceed to Pay | ₹500',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void _showMyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(
            color: Colors
                .grey[50], // Slightly darker background for the whole sheet
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BottomSheetContent(
                onUpdateDetails: _updateShiftingDetails,
                initialSelectedDate: _selectedDate,
                initialSelectedTimeSlot: _selectedTimeSlot),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text(
                    _selectedDate != null
                        ? 'Shifting on ${DateFormat('dd MMM').format(_selectedDate!)} ${DateFormat('h:mm a').format(_selectedDate!)} - $_selectedTimeSlot'
                        : 'Select Date & Time',
                    style: TextStyle(fontSize: 14)),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue[700],
                  ),
                  onPressed: () {
                    _showMyBottomSheet(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuccessPage()));
                },
                child: const Text(
                  'Proceed to Pay | ₹500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int index) {
    bool isCompleted = index < currentStep;
    bool isActive = index == currentStep;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ? Colors.green
                : isActive
                    ? Colors.blue[700]
                    : Colors.white,
            border: Border.all(
              color: isCompleted
                  ? Colors.green
                  : isActive
                      ? Colors.blue[700]!
                      : Colors.grey,
              width: 1.5,
            ),
          ),
          child: Icon(
            isCompleted ? Icons.check : stepIcons[index],
            color: isCompleted || isActive ? Colors.white : Colors.grey,
            size: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          stepTitles[index],
          style: TextStyle(
            fontSize: 10,
            color: isActive || isCompleted ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Container(
      width: 30,
      height: 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              10,
              (index) => Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;

  DottedLinePainter({
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
    this.dashLength = 5.0,
    this.dashSpace = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashLength),
        paint,
      );
      startY += dashLength + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Repaint only if properties change
  }
}

class LocationTile extends StatelessWidget {
  final IconData icon;
  final String locationText;
  final String address;
  final kolor;

  const LocationTile({
    Key? key,
    required this.icon,
    required this.locationText,
    required this.address,
    required this.kolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, color: kolor),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationText,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                Text(
                  address,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black54),
        ],
      ),
    );
  }
}

class PaymentRow extends StatelessWidget {
  final String title;
  final String amount;

  const PaymentRow({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black87),
          ),
          Text(
            amount,
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  final Function(DateTime?, String) onUpdateDetails;
  final DateTime? initialSelectedDate;
  final String initialSelectedTimeSlot;

  BottomSheetContent(
      {required this.onUpdateDetails,
      this.initialSelectedDate,
      this.initialSelectedTimeSlot = '7:00 - 8:00'});

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  DateTime? _selectedDate;
  String _selectedTimeSlot = '7:00 - 8:00';
  final ScrollController _scrollController = ScrollController();
  int _expandedTileIndex = -1;

  List<DateTime> _generateDates() {
    List<DateTime> dates = [];
    DateTime now = DateTime.now();
    for (int i = 0; i < 365; i++) {
      dates.add(now.add(Duration(days: i)));
    }
    return dates;
  }

  @override
  void initState() {
    super.initState();
    _selectedDate =
        widget.initialSelectedDate ?? DateTime.now(); // Default to Today
    _selectedTimeSlot = widget.initialSelectedTimeSlot;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> availableDates = _generateDates();
    DateTime yearFromNow = DateTime.now().add(Duration(days: 365));

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.blue[800]),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: AutoSizeText(
                        "You can reschedule the booking anytime for free",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blue[800], fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text("Booked for", style: TextStyle(fontWeight: FontWeight.w500)),
              Text(DateFormat('MMM\nyyyy').format(yearFromNow),
                  style: TextStyle(fontSize: 10.0, color: Colors.grey)),
              SizedBox(height: 8.0),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: availableDates.length,
                  itemBuilder: (context, index) {
                    DateTime date = availableDates[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: _buildDateButton(date, context, "1,199"),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select pickup slot",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              ExpansionTile(
                initiallyExpanded: _expandedTileIndex == 0,
                title: Row(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.blueGrey),
                    SizedBox(width: 8),
                    Text("Morning"),
                  ],
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _expandedTileIndex = expanded ? 0 : -1;
                  });
                },
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: [
                      _buildTimeSlotButton("6:00 - 7:00", context),
                      _buildTimeSlotButton("7:00 - 8:00", context),
                      _buildTimeSlotButton("8:00 - 9:00", context),
                      _buildTimeSlotButton("9:00 - 10:00", context),
                      _buildTimeSlotButton("10:00 - 11:00", context),
                      _buildTimeSlotButton("11:00 - 12:00", context),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                initiallyExpanded: _expandedTileIndex == 1,
                title: Row(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.amber),
                    SizedBox(width: 8),
                    Text("Afternoon"),
                  ],
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _expandedTileIndex = expanded ? 1 : -1;
                  });
                },
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: [
                      _buildTimeSlotButton("13:00 - 14:00", context),
                      _buildTimeSlotButton("14:00 - 15:00", context),
                      _buildTimeSlotButton("15:00 - 16:00", context),
                      _buildTimeSlotButton("16:00 - 17:00", context),
                      _buildTimeSlotButton("17:00 - 18:00", context),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                initiallyExpanded: _expandedTileIndex == 2,
                title: Row(
                  children: [
                    Icon(Icons.wb_twilight, color: Colors.blue[700]),
                    SizedBox(width: 8),
                    Text("Evening"),
                  ],
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _expandedTileIndex = expanded ? 2 : -1;
                  });
                },
                children: [
                  Wrap(spacing: 6.0, children: [
                    _buildTimeSlotButton("18:00 - 19:00", context),
                    _buildTimeSlotButton("19:00 - 10:00", context),
                    _buildTimeSlotButton("20:00 - 21:00", context),
                    _buildTimeSlotButton("21:00 - 22:00", context),
                    _buildTimeSlotButton("22:00 - 23:00", context),
                  ])
                ],
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textStyle: TextStyle(color: Colors.white),
                      padding: EdgeInsets.symmetric(vertical: 16.0)),
                  onPressed: () {
                    // Handle continue action
                    widget.onUpdateDetails(_selectedDate, _selectedTimeSlot);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -75,
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
                    offset: Offset(0, 2),
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
    );
  }

  Widget _buildDateButton(DateTime date, BuildContext context, String price) {
    bool isSelected = _selectedDate != null && _selectedDate == date;
    String day = DateFormat('d').format(date);
    String label = DateFormat('EEE').format(date);

    return SizedBox(
      width: 70,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: 1.0,
          ),
          backgroundColor: isSelected ? Colors.blue[50] : Colors.white,
        ),
        onPressed: () {
          setState(() {
            _selectedDate = date;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day, style: TextStyle(fontSize: 16, color: Colors.black)),
            Text(label,
                style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            Text(
              "*$price",
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlotButton(String timeSlot, BuildContext context) {
    bool isSelected = _selectedTimeSlot == timeSlot;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: 1.0,
        ),
        backgroundColor: isSelected ? Colors.blue[50] : Colors.white,
      ),
      onPressed: () {
        setState(() {
          _selectedTimeSlot = timeSlot;
        });
      },
      child:
          Text(timeSlot, style: TextStyle(fontSize: 12.0, color: Colors.black)),
    );
  }
}

// void _showMyBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (BuildContext bc) {
//       return Container(
//         decoration: BoxDecoration(
//           color:
//               Colors.grey[50], // Slightly darker background for the whole sheet
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//           ),
//         ),
//         padding:
//             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: BottomSheetContent(),
//         ),
//       );
//     },
//   );
// }
//
// class BottomSheetContent extends StatefulWidget {
//   @override
//   _BottomSheetContentState createState() => _BottomSheetContentState();
// }
//
// class _BottomSheetContentState extends State<BottomSheetContent> {
//   DateTime? _selectedDate; // Change to DateTime?
//   String _selectedTimeSlot = '7:00 - 8:00';
//   final ScrollController _scrollController = ScrollController();
//   int _expandedTileIndex = -1; // -1 means no tile is expanded
//
//   // Function to generate dates for the next few days
//   List<DateTime> _generateDates() {
//     List<DateTime> dates = [];
//     DateTime now = DateTime.now();
//     for (int i = 0; i < 365; i++) {
//       // Increased date range
//       dates.add(now.add(Duration(days: i)));
//     }
//     return dates;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = DateTime.now(); // Default to Today
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<DateTime> availableDates = _generateDates();
//
//     // Get the date a year from now for displaying book year
//     DateTime yearFromNow = DateTime.now().add(Duration(days: 365));
//
//     return Stack(
//       alignment: Alignment.topCenter,
//       clipBehavior: Clip.none,
//       children: [
//         SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               SizedBox(height: 40),
//
//               // Reschedule message
//               Container(
//                 padding: EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.blue[50],
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.lightbulb, color: Colors.blue[800]),
//                     SizedBox(width: 8.0),
//                     Expanded(
//                       child: AutoSizeText(
//                         "You can reschedule the booking anytime for free",
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(color: Colors.blue[800], fontSize: 12),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//
//               // Booked for section
//               Text("Booked for", style: TextStyle(fontWeight: FontWeight.w500)),
//               Text(
//                   DateFormat('MMM\nyyyy').format(
//                       yearFromNow), // Dynamically display the booked for date
//                   style: TextStyle(fontSize: 10.0, color: Colors.grey)),
//               SizedBox(height: 8.0),
//
//               // Horizontal Date List
//               SizedBox(
//                 height: 100, // Adjust height as needed
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: availableDates.length,
//                   itemBuilder: (context, index) {
//                     DateTime date = availableDates[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       child: _buildDateButton(date, context, "1,199"),
//                     );
//                   },
//                 ),
//               ),
//
//               SizedBox(height: 24.0),
//
//               // Pickup Slot section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Select pickup slot",
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//               ),
//
//               // Morning
//               ExpansionTile(
//                 initiallyExpanded: _expandedTileIndex == 0,
//                 title: Row(
//                   children: [
//                     Icon(Icons.wb_sunny, color: Colors.blueGrey),
//                     SizedBox(width: 8),
//                     Text("Morning"),
//                   ],
//                 ),
//                 onExpansionChanged: (bool expanded) {
//                   setState(() {
//                     _expandedTileIndex = expanded ? 0 : -1;
//                   });
//                 },
//                 children: [
//                   Wrap(
//                     spacing: 8.0,
//                     children: [
//                       _buildTimeSlotButton("6:00 - 7:00", context),
//                       _buildTimeSlotButton("7:00 - 8:00", context),
//                       _buildTimeSlotButton("8:00 - 9:00", context),
//                       _buildTimeSlotButton("9:00 - 10:00", context),
//                       _buildTimeSlotButton("10:00 - 11:00", context),
//                       _buildTimeSlotButton("11:00 - 12:00", context),
//                     ],
//                   ),
//                 ],
//               ),
//
//               // Afternoon
//               ExpansionTile(
//                 initiallyExpanded: _expandedTileIndex == 1,
//                 title: Row(
//                   children: [
//                     Icon(Icons.wb_sunny, color: Colors.amber),
//                     SizedBox(width: 8),
//                     Text("Afternoon"),
//                   ],
//                 ),
//                 onExpansionChanged: (bool expanded) {
//                   setState(() {
//                     _expandedTileIndex = expanded ? 1 : -1;
//                   });
//                 },
//                 children: [
//                   Wrap(
//                     spacing: 8.0,
//                     children: [
//                       _buildTimeSlotButton("13:00 - 14:00", context),
//                       _buildTimeSlotButton("14:00 - 15:00", context),
//                       _buildTimeSlotButton("15:00 - 16:00", context),
//                       _buildTimeSlotButton("16:00 - 17:00", context),
//                       _buildTimeSlotButton("17:00 - 18:00", context),
//                     ],
//                   ),
//                   // Add afternoon time slots here
//                 ],
//               ),
//
//               // Evening
//               ExpansionTile(
//                 initiallyExpanded: _expandedTileIndex == 2,
//                 title: Row(
//                   children: [
//                     Icon(Icons.wb_twilight, color: Colors.blue[700]),
//                     SizedBox(width: 8),
//                     Text("Evening"),
//                   ],
//                 ),
//                 onExpansionChanged: (bool expanded) {
//                   setState(() {
//                     _expandedTileIndex = expanded ? 2 : -1;
//                   });
//                 },
//                 children: [
//                   Wrap(spacing: 6.0, children: [
//                     _buildTimeSlotButton("18:00 - 19:00", context),
//                     _buildTimeSlotButton("19:00 - 10:00", context),
//                     _buildTimeSlotButton("20:00 - 21:00", context),
//                     _buildTimeSlotButton("21:00 - 22:00", context),
//                     _buildTimeSlotButton("22:00 - 23:00", context),
//                   ])
//                 ],
//               ),
//
//               SizedBox(height: 16.0),
//
//               // Continue button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue[700],
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       textStyle: TextStyle(color: Colors.white),
//                       padding: EdgeInsets.symmetric(vertical: 16.0)),
//                   onPressed: () {
//                     // Handle continue action
//                     if (_selectedDate != null) {
//                       print(
//                           "Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}"); // Format the DateTime
//                     } else {
//                       print("No date selected");
//                     }
//                     print("Selected Time Slot: $_selectedTimeSlot");
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     "Continue",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: -75,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 3,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 Icons.close,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildDateButton(DateTime date, BuildContext context, String price) {
//     bool isSelected = _selectedDate != null && _selectedDate == date;
//     String day = DateFormat('d').format(date);
//     String label = DateFormat('EEE').format(date);
//
//     return SizedBox(
//       width: 70, // Fixed width for each date button
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//           padding: EdgeInsets.all(10.0),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           side: BorderSide(
//             color: isSelected ? Colors.blue : Colors.grey[300]!,
//             width: 1.0,
//           ),
//           backgroundColor: isSelected ? Colors.blue[50] : Colors.white,
//         ),
//         onPressed: () {
//           setState(() {
//             _selectedDate = date;
//           });
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(day, style: TextStyle(fontSize: 16, color: Colors.black)),
//             Text(label,
//                 style: TextStyle(fontSize: 12, color: Colors.grey[700])),
//             Text(
//               "*$price",
//               style: TextStyle(fontSize: 12, color: Colors.green),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTimeSlotButton(String timeSlot, BuildContext context) {
//     bool isSelected = _selectedTimeSlot == timeSlot;
//
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//         side: BorderSide(
//           color: isSelected ? Colors.blue : Colors.grey[300]!,
//           width: 1.0,
//         ),
//         backgroundColor: isSelected ? Colors.blue[50] : Colors.white,
//       ),
//       onPressed: () {
//         setState(() {
//           _selectedTimeSlot = timeSlot;
//         });
//       },
//       child:
//           Text(timeSlot, style: TextStyle(fontSize: 12.0, color: Colors.black)),
//     );
//   }
// }
