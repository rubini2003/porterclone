import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/AddStopScreen.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/bookingReviewscreen.dart';

class VehicleSelection extends StatefulWidget {
  @override
  State<VehicleSelection> createState() => _VehicleSelectionState();
}

class _VehicleSelectionState extends State<VehicleSelection> {
  String? selectedVehicle;

  void _handleVehicleSelection(String vehicleName) {
    setState(() {
      selectedVehicle = vehicleName;
    });
    print("Selected Vehicle: $selectedVehicle");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Select Vehicle',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.3), // Adjust opacity as needed
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Rubini Dharmarajan • 7358177393',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            'Poonamallee High Rd, Alwartirunagar, Ma...',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: Icon(Icons.swap_vert),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'A saranya Clg • 8610943047',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Guindy Railway Station Bus Stop, MKN R...',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddStopScreen()));
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.blue),
                                    label: const Text(
                                      'Add Stop',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddStopScreen()));
                                    },
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    label: const Text(
                                      'Edit Locations',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Vehicle Options
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.68,
            minChildSize: 0.68,
            maxChildSize: 0.98,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: Container(
                            height: 7,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (selectedVehicle != null)
                          _buildSelectedVehicleDetails(selectedVehicle!),
                        VehicleOption(
                          name: '2 Wheeler',
                          description: '20 kg • 1 mins',
                          price: '₹202',
                          isSelected: selectedVehicle == '2 Wheeler',
                          image: "assets/image/scooter.png",
                          largeImage:
                              "assets/image/scooterdark.png", //Different Image
                          capacity: '40 cm',
                          onSelect: _handleVehicleSelection,
                        ),
                        VehicleOption(
                          name: '3Wheeler',
                          description: ' --',
                          price: '₹867',
                          isNew: true,
                          image: "assets/image/3wheeler.png",
                          largeImage:
                              "assets/image/3wheelerdark.png", //Different Image
                          isSelected: selectedVehicle == '3Wheeler',
                          onSelect: _handleVehicleSelection,
                        ),
                        VehicleOption(
                          name: 'Tata Ace (Open)',
                          description: '750 Kg • 1 mins',
                          price: '₹548',
                          isNew: true,
                          image: "assets/image/tata_ace.png",
                          largeImage:
                              "assets/image/tata_ace_dark.png", //Different Image
                          isSelected: selectedVehicle == 'Tata Ace (Open)',
                          onSelect: _handleVehicleSelection,
                        ),
                        VehicleOption(
                          name: 'Tata Ace (Another)',
                          description: '750 Kg • --',
                          price: '₹548',
                          isNew: true,
                          image: "assets/image/mini.png",
                          largeImage:
                              "assets/image/minidark.png", //Different Image
                          isSelected: selectedVehicle == 'Tata Ace (Another)',
                          onSelect: _handleVehicleSelection,
                        ),
                        VehicleOption(
                          name: 'Pickup 8ft',
                          description: '1700 Kg • 1 mins',
                          price: '₹1115',
                          isNew: true,
                          image: "assets/image/8ft.png",
                          largeImage:
                              "assets/image/8ftdark.png", //Different Image
                          isSelected: selectedVehicle == 'Pickup 8ft',
                          onSelect: _handleVehicleSelection,
                        ),
                        VehicleOption(
                          name: '17ft',
                          description: ' --',
                          price: '₹2867',
                          isNew: true,
                          image: "assets/image/17ft.png",
                          largeImage:
                              "assets/image/17ftdark.png", //Different Image
                          isSelected: selectedVehicle == '17ft',
                          onSelect: _handleVehicleSelection,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReviewBookingScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Proceed With ${selectedVehicle ?? 'Select a Vehicle'}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedVehicleDetails(String vehicleName) {
    String image = "assets/image/scooterdark.png";
    String description = '20 kg • 1 mins';
    String price = '₹202';

    if (vehicleName == "Tata Ace (Open)") {
      image = "assets/image/tata_ace_dark.png";
      description = '750 Kg • 1 mins';
      price = '₹548';
    }
    if (vehicleName == "Tata Ace (Another)") {
      image = "assets/image/minidark.png";
      description = '750 Kg • --';
      price = '₹548';
    }
    if (vehicleName == "Pickup 8ft") {
      image = "assets/image/8ftdark.png";
      description = '1700 Kg • 1 mins';
      price = '₹1115';
    }
    if (vehicleName == "17ft") {
      image = "assets/image/17ftdark.png";
      description = '--';
      price = '₹2867';
    }
    if (vehicleName == "3Wheeler") {
      image = "assets/image/3wheelerdark.png";
      description = '--';
      price = '₹867';
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
            colors: [Colors.blue.withOpacity(0.1), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.centerRight),

        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2), // Selection border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
            width: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    vehicleName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Text(
                price,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VehicleOption extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String image;
  final String largeImage; // added large image
  final bool isNew;
  final bool isSelected;
  final String? capacity;
  final Function(String) onSelect;

  const VehicleOption({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.largeImage, // added large image
    this.isNew = false,
    this.isSelected = false,
    this.capacity,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(name);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border:
                isSelected ? Border.all(color: Colors.blue, width: 2) : null,
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              else
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
            ],
            color: Colors
                .white, // Set background color to white, as Card is white by default
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 80,
                height: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (isNew)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: const Text(
                              "NEW",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
