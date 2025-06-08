import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddStopScreen extends StatefulWidget {
  @override
  State<AddStopScreen> createState() => _AddStopScreenState();
}

class _AddStopScreenState extends State<AddStopScreen> {
  List<String> stopHints = ['Where is your Stop 1?'];
  List<String> stopLocations = [];
  List<LatLng> stopCoordinates = []; // List to hold LatLng coordinates
  final int maxStops = 4;

  // Map related variables
  LatLng _mapCenter = LatLng(13.0475, 80.0784); // Default center
  MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Handle denied permissions
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _mapCenter = LatLng(position.latitude, position.longitude);
        _mapController.move(_mapCenter, 15.0); // Move the map
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> _updateCoordinates(int index, String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        LatLng newCoordinate =
            LatLng(locations.first.latitude, locations.first.longitude);

        setState(() {
          while (stopCoordinates.length <= index) {
            stopCoordinates.add(LatLng(0.0, 0.0));
          }

          stopCoordinates[index] = newCoordinate;
        });
      } else {
        // Handle case where no coordinates were found
        print('No coordinates found for address: $address');
      }
    } catch (e) {
      print('Error geocoding address: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); //Handle back navigation.
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(color: Colors.white, child: _buildRouteInfoSection()),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                alignment: Alignment.center,
                child: _buildMap(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildRouteHeader(),
          SizedBox(height: 16.0),
          ReorderableListView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Disable scrolling in ReorderableListView
            itemCount: stopHints.length,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final String hint = stopHints.removeAt(oldIndex);
                stopHints.insert(newIndex, hint);

                // Move corresponding location data as well
                if (stopLocations.isNotEmpty &&
                    oldIndex < stopLocations.length) {
                  final String location = stopLocations.removeAt(oldIndex);
                  // Ensure stopLocations has enough capacity before inserting
                  while (stopLocations.length <= newIndex) {
                    stopLocations.add('');
                  }
                  stopLocations.insert(newIndex, location);
                }

                if (stopCoordinates.isNotEmpty &&
                    oldIndex < stopCoordinates.length) {
                  final LatLng coordinate = stopCoordinates.removeAt(oldIndex);
                  // Ensure stopCoordinates has enough capacity before inserting
                  while (stopCoordinates.length <= newIndex) {
                    stopCoordinates.add(LatLng(0.0, 0.0));
                  }
                  stopCoordinates.insert(newIndex, coordinate);
                }

                // Rebuild the hints to reflect the updated indices.
                stopHints = stopHints.asMap().entries.map((entry) {
                  int idx = entry.key;
                  return 'Where is your Stop ${idx + 1}?';
                }).toList();
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _buildStopInput(stopHints[index], index,
                  key: Key(
                      '$index')); // Key is important for ReorderableListView
            },
          ),
          SizedBox(height: 8.0),
          if (stopHints.length < maxStops) _buildAddStopButton(),
        ],
      ),
    );
  }

  Widget _buildRouteHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              'Rubini Dharmarajan . 7358177393\nPoonamallee High Rd, Alwartirunagar, ...',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Icon(Icons.menu),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: _mapCenter,
        initialZoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: stopCoordinates.asMap().entries.map((entry) {
            int index = entry.key;
            return Marker(
              point: stopCoordinates[index],
              width: 40.0,
              height: 40.0,
              child: Icon(Icons.location_pin, color: Colors.red, size: 30),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStopInput(String hintText, int index, {Key? key}) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '${index + 1}',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  while (stopLocations.length <= index) {
                    stopLocations.add('');
                  }
                  stopLocations[index] = value;
                });

                // Call function to update coordinates based on address
                _updateCoordinates(index, value);
              },
              controller: TextEditingController(
                  text: stopLocations.length > index
                      ? stopLocations[index]
                      : ''), // Set controller to display existing text
            ),
          ),
          ReorderableDragStartListener(
            index: index,
            child: Icon(Icons.menu),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                stopHints.removeAt(index);
                if (stopLocations.isNotEmpty && index < stopLocations.length) {
                  stopLocations.removeAt(index);
                }
                if (stopCoordinates.isNotEmpty &&
                    index < stopCoordinates.length) {
                  stopCoordinates.removeAt(index);
                }
                // Rebuild the hints to reflect the updated indices.
                stopHints = stopHints.asMap().entries.map((entry) {
                  int idx = entry.key;
                  return 'Where is your Stop ${idx + 1}?';
                }).toList();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddStopButton() {
    return ElevatedButton.icon(
      onPressed: () {
        if (stopHints.length < maxStops) {
          setState(() {
            stopHints.add('Where is your Stop ${stopHints.length + 1}?');
          });
        }
      },
      icon: Icon(Icons.add),
      label: Text('ADD STOP'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
// class AddStopScreen extends StatefulWidget {
//   @override
//   State<AddStopScreen> createState() => _AddStopScreenState();
// }
//
// class _AddStopScreenState extends State<AddStopScreen> {
//   List<String> stopHints = ['Where is your Stop 1?', 'Where is your Stop 2?'];
//   List<String> stopLocations = [];
//   final int maxStops = 4;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context); //Handle back navigation.
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Column(
//         children: [
//           Container(color: Colors.white, child: _buildRouteInfoSection()),
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: Container(
//                 alignment: Alignment.center,
//                 child: _buildMap(),
//                 // Text(
//                 //   'Map Placeholder\n(Map functionality removed in this version)',
//                 //   textAlign: TextAlign.center,
//                 //   style: TextStyle(fontSize: 18, color: Colors.grey),
//                 // ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRouteInfoSection() {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           _buildRouteHeader(),
//           SizedBox(height: 16.0),
//           ReorderableListView.builder(
//             shrinkWrap: true,
//             physics:
//                 NeverScrollableScrollPhysics(), // Disable scrolling in ReorderableListView
//             itemCount: stopHints.length,
//             onReorder: (int oldIndex, int newIndex) {
//               setState(() {
//                 if (oldIndex < newIndex) {
//                   newIndex -= 1;
//                 }
//                 final String hint = stopHints.removeAt(oldIndex);
//                 stopHints.insert(newIndex, hint);
//
//                 // Move corresponding location data as well
//                 if (stopLocations.isNotEmpty &&
//                     oldIndex < stopLocations.length) {
//                   final String location = stopLocations.removeAt(oldIndex);
//                   // Ensure stopLocations has enough capacity before inserting
//                   while (stopLocations.length <= newIndex) {
//                     stopLocations.add('');
//                   }
//                   stopLocations.insert(newIndex, location);
//                 }
//
//                 // Rebuild the hints to reflect the updated indices.
//                 stopHints = stopHints.asMap().entries.map((entry) {
//                   int idx = entry.key;
//                   return 'Where is your Stop ${idx + 1}?';
//                 }).toList();
//               });
//             },
//             itemBuilder: (BuildContext context, int index) {
//               return _buildStopInput(stopHints[index], index,
//                   key: Key(
//                       '$index')); // Key is important for ReorderableListView
//             },
//           ),
//           SizedBox(height: 8.0),
//           if (stopHints.length < maxStops) _buildAddStopButton(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRouteHeader() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: EdgeInsets.all(12.0),
//       child: Row(
//         children: [
//           Container(
//             width: 8.0,
//             height: 8.0,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               shape: BoxShape.circle,
//             ),
//           ),
//           SizedBox(width: 8.0),
//           Expanded(
//             child: Text(
//               'Rubini Dharmarajan . 7358177393\nPoonamallee High Rd, Alwartirunagar, ...',
//               style: TextStyle(fontSize: 14.0),
//             ),
//           ),
//           Icon(Icons.menu),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMap() {
//     return FlutterMap(
//       options: MapOptions(
//         initialCenter: LatLng(13.0475, 80.0784), // Default center
//         initialZoom: 15.0, // Closer zoom level
//       ),
//       children: [
//         TileLayer(
//           urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//         ),
//         MarkerLayer(
//           markers: stopLocations.asMap().entries.map((entry) {
//             int index = entry.key;
//             return Marker(
//               point:
//                   LatLng(13.0475 + (index * 0.002), 80.0784 + (index * 0.002)),
//               width: 40.0,
//               height: 40.0,
//               child: Icon(Icons.location_pin, color: Colors.red, size: 30),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildStopInput(String hintText, int index, {Key? key}) {
//     return Container(
//       key: key,
//       margin: const EdgeInsets.symmetric(vertical: 4.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12.0),
//             child: Text(
//               '${index + 1}',
//               style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: InputBorder.none,
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   // Ensure stopLocations has enough capacity.  Otherwise it will throw an index out of bounds exception.
//                   while (stopLocations.length <= index) {
//                     stopLocations.add('');
//                   }
//                   stopLocations[index] = value;
//                 });
//               },
//               controller: TextEditingController(
//                   text: stopLocations.length > index
//                       ? stopLocations[index]
//                       : ''), // Set controller to display existing text
//             ),
//           ),
//           ReorderableDragStartListener(
//             index: index,
//             child: Icon(Icons.menu),
//           ),
//           IconButton(
//             icon: Icon(Icons.close),
//             onPressed: () {
//               setState(() {
//                 stopHints.removeAt(index);
//                 if (stopLocations.isNotEmpty && index < stopLocations.length) {
//                   stopLocations.removeAt(index);
//                 }
//                 // Rebuild the hints to reflect the updated indices.
//                 stopHints = stopHints.asMap().entries.map((entry) {
//                   int idx = entry.key;
//                   return 'Where is your Stop ${idx + 1}?';
//                 }).toList();
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAddStopButton() {
//     return ElevatedButton.icon(
//       onPressed: () {
//         if (stopHints.length < maxStops) {
//           setState(() {
//             stopHints.add('Where is your Stop ${stopHints.length + 1}?');
//           });
//         }
//       },
//       icon: Icon(Icons.add),
//       label: Text('ADD STOP'),
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       ),
//     );
//   }
// }
