import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/packer&mover/orderSummaryscreen.dart';
import 'package:porter_clone/helper/dimension.dart';

class MiniTruck extends StatefulWidget {
  const MiniTruck({super.key});

  @override
  State<MiniTruck> createState() => _MiniTruckState();
}

class _MiniTruckState extends State<MiniTruck> {
  TextEditingController pickup = TextEditingController();
  TextEditingController pickupflr = TextEditingController();
  TextEditingController dropup = TextEditingController();
  TextEditingController dropupflr = TextEditingController();
  bool isChecked = false;
  bool isCheckedin = false;
  DateTime? selectedDate;
  String? selectedTime;
  bool isTimeEnabled = false;
  int selectedIndex = -1; // No selection initially

  final List<String> options = [
    "Household items",
    "Electronics",
    "Commercial goods",
    "Others"
  ];

  List<String> getTimeSlots() {
    List<String> timeSlots = [];
    TimeOfDay startTime = TimeOfDay(hour: 8, minute: 0); // 8:00 AM
    TimeOfDay endTime = TimeOfDay(hour: 21, minute: 0); // 9:00 PM

    while (startTime.hour < endTime.hour ||
        (startTime.hour == endTime.hour &&
            startTime.minute <= endTime.minute)) {
      String formattedTime =
          "${startTime.hourOfPeriod}:${startTime.minute.toString().padLeft(2, '0')} ${startTime.period == DayPeriod.am ? "AM" : "PM"}";
      timeSlots.add(formattedTime);

      // Increment by 30 minutes
      int newMinute = startTime.minute + 30;
      int newHour = startTime.hour;
      if (newMinute >= 60) {
        newMinute -= 60;
        newHour += 1;
      }
      startTime = TimeOfDay(hour: newHour, minute: newMinute);
    }

    return timeSlots;
  }

  // Function to pick a date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        isTimeEnabled = true; // Enable time dropdown
        selectedTime = null; // Reset time when a new date is picked
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> timeSlots = getTimeSlots();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset("assets/image/shipped.png",
                                height: 50, width: 30),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Mini truck with a labour service helps with immediate moving requirements of your goods.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Enter Booking Details",
                  style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'Pickup Address',
                  titleText: 'Enter Pickup Address',
                  controller: pickup,
                  inputType: TextInputType.text,
                  prefixIcon: Icons.location_pin,
                  required: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Side: Checkbox and Text
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            // Allows text to wrap properly
                            child: Text(
                              "has Service Lift ?",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Right Side: Floor No. TextField
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 100, // Adjust width as needed
                        child: CustomTextField(
                          labelText: 'Floor no',
                          titleText: 'floor no',
                          controller: pickupflr,
                          inputType: TextInputType.text,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  labelText: 'Drop Address',
                  titleText: 'Enter Drop Address',
                  controller: dropup,
                  inputType: TextInputType.text,
                  prefixIcon: Icons.location_pin,
                  required: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Side: Checkbox and Text
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            // Allows text to wrap properly
                            child: Text("has Service Lift ?",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),

                    // Right Side: Floor No. TextField
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 100, // Adjust width as needed
                        child: CustomTextField(
                          labelText: 'Floor no',
                          titleText: 'floor no',
                          controller: pickupflr,
                          inputType: TextInputType.text,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    // Pickup Date Field
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Pickup Date",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15), // Shortened height
                      ),
                      onTap: () => _selectDate(context),
                      controller: TextEditingController(
                        text: selectedDate != null
                            ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
                            : "",
                      ),
                    ),
                    SizedBox(
                      height: 20, // Adjusted spacing between fields
                    ),
                    // Pickup Time Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedTime,
                      items: timeSlots.map((String time) {
                        return DropdownMenuItem<String>(
                          value: time,
                          child: Text(time),
                        );
                      }).toList(),
                      onChanged: isTimeEnabled
                          ? (String? newValue) {
                              setState(() {
                                selectedTime = newValue;
                              });
                            }
                          : null, // Disable if no date is selected
                      decoration: InputDecoration(
                        labelText: "Pickup Time",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15), // Shortened height
                      ),
                      disabledHint: Text("Select Date First"),
                    ),
                    SizedBox(
                      height: 30, // Adjusted spacing between fields
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Items Should be shifted :",
                        )),
                    SizedBox(height: 10),
                    Container(
                      height: 200, // Adjust height to fit grid
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // Disable scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              3.5, // Adjust for proper width/height
                        ),
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index; // Update selected index
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue.withOpacity(0.2)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.blueAccent.withOpacity(0.2)
                                      : Colors.black26,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  options[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to previous screen
                  }, // Disable if no selection
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded rectangle
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10), // Space between buttons

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSummaryScreen(),
                      ),
                    );
                    print("onTap is processed");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded rectangle
                    ),
                  ),
                  child: Text(
                    "PROCEED",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? titleText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final IconData? prefixIcon;
  final bool required;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.titleText,
    this.controller,
    required this.inputType,
    this.prefixIcon,
    this.required = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }
}
