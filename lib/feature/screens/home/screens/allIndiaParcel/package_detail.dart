import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/allitems.dart';
import 'package:porter_clone/feature/screens/home/screens/allIndiaParcel/estimateScreen.dart';
import 'package:porter_clone/helper/dimension.dart';

class SendPackage extends StatefulWidget {
  @override
  _SendPackageScreenState createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  bool isKgSelected = true;
  bool isCmSelected = true;
  bool _isSelecting = false;
  String _selectedCategory = "Household items";
  int currentStep = 1;
  final List<String> stepTitles = ["Address", "Package", "Estimate", "Review"];
  final List<Map<String, String>> items = [
    {"image": "assets/image/foods.jpeg", "name": "Foods"},
    {"image": "assets/image/Electronics.jpeg", "name": "Electronics"},
    {"image": "assets/image/liquiditems.jpeg", "name": "Liquid Items"},
    {"image": "assets/image/frangleitems.jpeg", "name": "Frangle Items"},
    {"image": "assets/image/machinery.jpeg", "name": "Machinery"},
    {"image": "assets/image/drugs.jpeg", "name": "Drugs"},
    {"image": "assets/image/alcohol.jpeg", "name": "Alcohol"},
    {"image": "assets/image/netcash.jpeg", "name": "Cash"},
    {"image": "assets/image/stones.jpeg", "name": "Stones"},
    {"image": "assets/image/gun.jpeg", "name": "Guns"},
    {
      "image": "assets/image/household_appliance.jpeg",
      "name": "Household_Appliance"
    },
    {"image": "assets/image/certificates.jpeg", "name": "Certificates"},
    {"image": "assets/image/original_ids.jpeg", "name": "Original ID'S"},
    {"image": "assets/image/demand_draft.jpeg", "name": "Demand Draft "},
    {"image": "assets/image/checks.jpeg", "name": "Checks"},
    {"image": "assets/image/suitcase.jpeg", "name": "Suitcase"},
    {"image": "assets/image/Electronics.jpeg", "name": "Electronics"},
    {"image": "assets/image/fireworks.jpeg", "name": "Fireworks"},
    {
      "image": "assets/image/plants and flowers.jpeg",
      "name": "Plants and Flowers"
    },
    {
      "image": "assets/image/magnatized material.jpeg",
      "name": "Magnetic Material"
    },
    {"image": "assets/image/batteries.jpeg", "name": "Batteries"},
    {"image": "assets/image/gold.jpeg", "name": "Precious Jewels"},
  ];

  final List<IconData> stepIcons = [
    Icons.location_pin,
    Icons.inventory_2,
    Icons.grid_view,
    Icons.receipt,
  ];

  bool get isFormFilled {
    return weightController.text.isNotEmpty &&
        lengthController.text.isNotEmpty &&
        widthController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        valueController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Send package",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  // Package Type
                  Text("Package Type",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelecting = !_isSelecting;
                          });
                        },
                        child: (!_isSelecting)
                            ? Container(
                                height: 60,
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.category,
                                            color: Colors.grey.shade600),
                                        SizedBox(width: 10),
                                        Text(_selectedCategory,
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    // Hide the TextButton if _isSelecting is true
                                    if (!_isSelecting) // Added conditional check here
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _isSelecting = true;
                                          });
                                        },
                                        child: Text("Change",
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (_isSelecting)
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: [
                            _buildCategoryButton("Document"),
                            _buildCategoryButton("Hardware"),
                            _buildCategoryButton("Books & stationary"),
                            _buildCategoryButton("Personal items"),
                            _buildCategoryButton("Clothes"),
                            _buildCategoryButton("Household items"),
                            _buildCategoryButton("Others"),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(Icons.block, color: Colors.grey.shade600),
                        SizedBox(width: 10),
                        AutoSizeText(
                            "Electronics or liquid items are not allowed",
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Warning Message
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning, color: Colors.orange),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Please enter the accurate weight and size to avoid additional charges",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Enter Package Weight
                  Text("Enter package weight",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "0.00",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(12),
                            ),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      _buildWeightUnitButtons(),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Enter Package Size
                  Text("Enter package size",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: lengthController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Length",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: widthController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Width",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Height",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildSizeUnitButtons(),
                  SizedBox(height: 20),

                  Text("Enter package value",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: valueController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "0",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(12),
                            prefixText:
                                "₹ ", // Keeps the ₹ symbol inside the TextField
                            prefixStyle:
                                TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Text("₹ ", style: TextStyle(fontSize: 16)),
                  //     Expanded(
                  //       child: TextField(
                  //         controller: valueController,
                  //         keyboardType: TextInputType.number,
                  //         decoration: InputDecoration(
                  //           hintText: "0",
                  //           border: OutlineInputBorder(),
                  //           contentPadding: EdgeInsets.all(12),
                  //         ),
                  //         onChanged: (_) => setState(() {}),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 20),

                  // Items NOT allowed
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Items NOT allowed",
                              style: TextStyle(fontSize: 16)),
                          TextButton(
                            onPressed: () {
                              // Navigate to the full list page with items
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AllItemsPage(items: items),
                                ),
                              );
                            },
                            child: Text("See all(22)",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          children: items.map((item) {
                            return itemCard(item["image"]!, item["name"]!);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          if (isFormFilled)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text("You'll be charged for"),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style.copyWith(
                                  fontFamily:
                                      'Roboto', // Ensure a proper font is used
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '10 kg ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  decoration: TextDecoration
                                      .none, // Ensure no underline
                                ),
                              ),
                              TextSpan(
                                text: 'see why?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.dotted,
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _showChargeableWeightBottomSheet(context);
                                  },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width:
                          16), // Add spacing between the expanded and the button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 24), // Adjust horizontal padding
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => estimatePage(),
                        ),
                      );
                    },
                    child: Text("Proceed",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            )
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

  void _showChargeableWeightBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Add this line
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7, // Adjust this value as needed
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  'Chargeable weight',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Highest between actual & volumetric weights, considered for price calculation.',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '10 kg',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'actual weight',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      Icon(Icons.chevron_right, size: 32),
                      Column(
                        children: [
                          Text(
                            '0.48 kg',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Volumetric weight\n(LxBxH)/5000',
                            style: TextStyle(
                              color: Colors.grey[600],
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What is chargeable weight ?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "Weight and size (L x B x H) in cms of the package determines it's handling and shipping processes. Hence, the highest among the volumetric weight and actual weight will be considered to calculate the shipping price.",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWeightUnitButtons() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isKgSelected = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isKgSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: isKgSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("kg"),
        ),
        SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isKgSelected = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                !isKgSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: !isKgSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("gm"),
        ),
      ],
    );
  }

  Widget itemCard(String imagePath, String itemName) {
    return Container(
      width: 90,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            itemName,
            style: TextStyle(fontSize: 14),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = category;
          _isSelecting = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedCategory == category
              ? Colors.blue.shade900
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: _selectedCategory == category ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSizeUnitButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isCmSelected = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isCmSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: isCmSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("cm"),
        ),
        SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isCmSelected = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                !isCmSelected ? Colors.blue[700] : Colors.grey.shade300,
            foregroundColor: !isCmSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text("inch"),
        ),
      ],
    );
  }
}
