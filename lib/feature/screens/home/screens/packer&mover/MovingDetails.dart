import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porter_clone/feature/screens/home/screens/packer&mover/add_items.dart';

class MovingDetailsPage extends StatefulWidget {
  @override
  _MovingDetailsPageState createState() => _MovingDetailsPageState();
}

class _MovingDetailsPageState extends State<MovingDetailsPage>
    with SingleTickerProviderStateMixin {
  int currentStep = 0;
  final List<String> stepTitles = [
    "Moving details",
    "Add items",
    "Add ons",
    "Review"
  ];

  final List<IconData> stepIcons = [
    Icons.location_pin,
    Icons.inventory_2,
    Icons.grid_view,
    Icons.receipt,
  ];

  late TabController _tabController;
  bool serviceLiftPickup = false;
  bool serviceLiftDrop = false;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Packers & Movers")),
      body: Column(
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100, // Background of TabBar
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.blue[700], // Active Tab Background
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white, // Active Tab Text
              unselectedLabelColor: Colors.blue[700], // Inactive Tab Text
              tabs: const [
                Tab(text: " Within City "),
                Tab(text: " Between Cities "),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildWithinCityMoving(), _buildWithinCityMoving(),
                // Center(
                //   child: Text("Between Cities Moving",
                //       style: TextStyle(fontSize: 20)),
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => Packers(),
                builder: (context) => AddItemsPage(),
              ),
            );
          },
          child: const Text(
            "CheckRates",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildWithinCityMoving() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildLocationCard(
            title: "Pickup location",
            location: "332V+P9H, 6, Poonamallee - Avadi High Rd...",
            icon: Icons.location_on,
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          _buildServiceLiftToggle(
              "Service lift available at pickup", serviceLiftPickup, (value) {
            setState(() {
              serviceLiftPickup = value;
            });
          }),
          const SizedBox(height: 10),
          _buildLocationCard(
            title: "Drop location",
            location: "Kanchipuram, Tamil Nadu 631501, India",
            icon: Icons.location_on,
            color: Colors.red,
          ),
          const SizedBox(height: 10),
          _buildServiceLiftToggle(
              "Service lift available at drop", serviceLiftDrop, (value) {
            setState(() {
              serviceLiftDrop = value;
            });
          }),
          const SizedBox(height: 20),
          _buildShiftingDate(),
          const SizedBox(height: 20),
          _buildDateButtons(),
        ],
      ),
    );
  }

  Widget _buildLocationCard(
      {required String title,
      required String location,
      required IconData icon,
      required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              location,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildServiceLiftToggle(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            const Text(
              "A working service lift will reduce the overall quote",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ],
    );
  }

  Widget _buildShiftingDate() {
    return GestureDetector(
      // Wrap with GestureDetector for onTap
      onTap: () => _selectDate(context), // Call date picker on tap
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "Shifting date: ${DateFormat('dd-MM-yyyy').format(selectedDate)}", // Use DateFormat for cleaner formatting
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  // Widget _buildShiftingDate() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Row(
  //       children: [
  //         const Icon(Icons.calendar_today, color: Colors.grey),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: Text(
  //             "Shifting date: ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
  //             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildDateButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: selectedDate.day == DateTime.now().day
                  ? Colors.blue[700] // Active (Selected)
                  : Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ) // Inactive
              ),
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
            });
          },
          child: Text(
            "Today",
            style: TextStyle(
              color: selectedDate.day == DateTime.now().day
                  ? Colors.white // Text color for selected button
                  : Colors.black, // Text color for inactive button
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: selectedDate.day ==
                      DateTime.now().add(const Duration(days: 1)).day
                  ? Colors.blue[700] // Active (Selected)
                  : Colors.grey[300], // Inactive,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now().add(const Duration(days: 1));
            });
          },
          child: Text(
            "Tomorrow",
            style: TextStyle(
              color: selectedDate.day ==
                      DateTime.now().add(const Duration(days: 1)).day
                  ? Colors.white // Text color for selected button
                  : Colors.black, // Text color for inactive button
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
