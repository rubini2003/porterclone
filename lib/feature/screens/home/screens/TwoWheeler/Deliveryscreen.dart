import 'package:auto_size_text/auto_size_text.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/VehicleSelection.dart';
import 'package:porter_clone/feature/screens/home/screens/TwoWheeler/pickup_drop_editscreen.dart'; // Import geolocator

class DeliveryScreen extends StatefulWidget {
  final String location;

  const DeliveryScreen({
    super.key,
    required this.location,
  });
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  LatLng _center = const LatLng(37.7748, -122.4194); // Default San Francisco
  GoogleMapController? mapController;
  String _address = "Fetching Location..."; // Initial address message

  bool _useMyNumber = true;
  final String _myPhoneNumber = '7358177393';
  //
  // String _address = "No.27/3 mgr nagar 2nd st ,thirumazhisai";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _phoneNumberController.text = _myPhoneNumber;
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _address = "Location permission denied.";
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _address =
              "Location permissions are permanently denied, we cannot request permissions.";
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _center = LatLng(position.latitude, position.longitude);
      });

      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: _center, zoom: 17))); // Zoom to the location

      // Reverse geocode to get address
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks != null && placemarks.isNotEmpty) {
          Placemark placemark = placemarks[0];
          setState(() {
            _address =
                "${placemark.name}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
          });
        } else {
          setState(() {
            _address = "Address not found.";
          });
        }
      } catch (e) {
        print("Error getting address: $e");
        setState(() {
          _address = "Error fetching address.";
        });
      }
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        _address = "Error: Could not get location.";
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // After the map is created, get the current location again to ensure the map is centered
    // and location is fetched.
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _getContact() async {
    var status = await Permission.contacts.status;
    if (!status.isGranted) {
      status = await Permission.contacts.request();
    }

    if (status.isGranted) {
      try {
        final Contact? contact =
            await ContactsService.openDeviceContactPicker();

        if (contact != null) {
          setState(() {
            _nameController.text = contact.displayName ?? '';
            if (contact.phones != null && contact.phones!.isNotEmpty) {
              _phoneNumberController.text = contact.phones!.first.value ?? '';
            } else {
              _phoneNumberController.text = ''; // Clear if no number
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact has no phone number.')),
              );
            }

            _useMyNumber = false;
          });

          print('Selected Contact: ${contact.displayName}');
          print(
              'Phone Number: ${contact.phones?.isNotEmpty == true ? contact.phones!.first.value : "No Phone Number"}');
        }
      } catch (e) {
        print('Error picking contact: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error accessing contacts.')),
        );
      }
    } else {
      print('Contacts permission denied');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Contacts permission required to select a contact.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Container(
          //     color: Colors.blue[200],
          //     child: Center(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           const Icon(Icons.map, size: 50, color: Colors.grey),
          //           const Text("Map View (No Google Maps API Key)",
          //               style: TextStyle(color: Colors.grey)),
          //           Text(
          //             _address,
          //             textAlign: TextAlign.center,
          //             style: const TextStyle(fontSize: 16),
          //           ), // Show address
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              myLocationEnabled: true, // Enable the my location button
              myLocationButtonEnabled:
                  true, // Show the my location button on the map
              markers: {
                Marker(
                  markerId: MarkerId("current_location"),
                  position: _center,
                  infoWindow:
                      InfoWindow(title: "You are here", snippet: _address),
                )
              },
            ),
          ),
          // Back Button
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                  _address.isNotEmpty
                                      ? _address
                                      : 'Fetching address...',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PickupLocationScreen(
                                              location: '${widget.location}',
                                            )));
                              },
                              child: const Text('Change'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            _address,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Address Input Field
                        SizedBox(
                          height: 48.0,
                          child: TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: 'House / Apartment / Shop (optional)',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Receiver's Name Input Field
                        SizedBox(
                          height: 48.0,
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: widget.location == "Drop"
                                  ? 'Receiver\'s Name'
                                  : 'Senders\'s Name',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.contacts_outlined),
                                onPressed: _getContact,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Receiver's Mobile Number Input Field
                        SizedBox(
                          height: 48.0,
                          child: TextField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: widget.location == "drop"
                                  ? 'Receiver\'s Mobile number'
                                  : 'Senders\'s Mobile number',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Checkbox(
                              value: _useMyNumber,
                              onChanged: (bool? value) {
                                setState(() {
                                  _useMyNumber = value ?? true;
                                  if (_useMyNumber) {
                                    _phoneNumberController.text =
                                        _myPhoneNumber;
                                  }
                                });
                              },
                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                            ),
                            Text('Use my mobile number: $_myPhoneNumber'),
                          ],
                        ),

                        // Save As Options
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: const Text('Save as (optional):'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Handle save as home
                                  },
                                  icon: const Icon(Icons.home),
                                  label: AutoSizeText('Home'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Handle save as shop
                                  },
                                  icon: const Icon(Icons.shopping_bag),
                                  label: AutoSizeText('Shop'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Handle save as other
                                  },
                                  icon: const Icon(Icons.favorite),
                                  label: AutoSizeText('Other'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     children: [
                        //       ElevatedButton.icon(
                        //         onPressed: () {
                        //           // Handle save as home
                        //         },
                        //         icon: const Icon(Icons.home),
                        //         label: const Text('Home'),
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: Colors.grey[200],
                        //           foregroundColor: Colors.black,
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(5.0),
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(width: 8),
                        //       ElevatedButton.icon(
                        //         onPressed: () {
                        //           // Handle save as shop
                        //         },
                        //         icon: const Icon(Icons.shopping_bag),
                        //         label: const Text('Shop'),
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: Colors.grey[200],
                        //           foregroundColor: Colors.black,
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(5.0),
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(width: 8),
                        //       ElevatedButton.icon(
                        //         onPressed: () {
                        //           // Handle save as other
                        //         },
                        //         icon: const Icon(Icons.favorite),
                        //         label: const Text('Other'),
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: Colors.grey[200],
                        //           foregroundColor: Colors.black,
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(5.0),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              print('Name: ${_nameController.text}');
              print('Phone: ${_phoneNumberController.text}');
              print('Address: ${_addressController.text}');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VehicleSelection()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Confirm And Proceed'),
          ),
        ),
      ),
    );
  }
}
