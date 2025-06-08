import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DropDetailsScreen extends StatefulWidget {
  final String location;

  const DropDetailsScreen({
    super.key,
    required this.location,
  });
  @override
  _DropDetailsScreenState createState() => _DropDetailsScreenState();
}

class _DropDetailsScreenState extends State<DropDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _houseNoController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    _nameController.text = "Dharma";
    _mobileController.text = "9790831260";
    _houseNoController.text = "16";
    _pincodeController.text = "631501";
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
              _mobileController.text = contact.phones!.first.value ?? '';
            } else {
              _mobileController.text = ''; // Clear if no number
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact has no phone number.')),
              );
            }
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.location == "pickup"
            ? 'Enter pickup details'
            : 'Enter drop details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Kanchipuram, Kanchip',
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              // Handle change location
                            },
                            child: Text('Change',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Kanchipuram, Kanchipuram, Tamil Nadu 631501, India',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.contacts_outlined),
                    onPressed: _getContact,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _houseNoController,
                decoration: InputDecoration(
                  labelText: 'House No/ Flat No/ Building Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _pincodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade300),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Kanchipuram, Tamil Nadu',
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Handle confirmation
                  if (_formKey.currentState!.validate()) {
                    // Process the data
                    print("Name: ${_nameController.text}");
                    print("Mobile: ${_mobileController.text}");
                    print("House No: ${_houseNoController.text}");
                    print("Pincode: ${_pincodeController.text}");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Colors.blue[700],
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Confirm', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
