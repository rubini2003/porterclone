import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/packer&mover/addone_page.dart';

class AddItemsPage extends StatefulWidget {
  @override
  _AddItemsPageState createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  int currentStep = 1;

  final List<String> tabTitles = ["Living Room", "Bedroom", "Kitchen", "Other"];

  final double itemHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    int currentIndex = (_scrollController.offset / itemHeight).round();
    if (currentIndex >= 0 && currentIndex < tabTitles.length) {
      setState(() {
        _selectedIndex = currentIndex;
      });
    }
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * itemHeight,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
            height: 40,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabTitles.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedIndex == index
                            ? Colors.blue[700]
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _scrollToIndex(index);
                      },
                      child: Text(
                        tabTitles[index],
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.blue[700],
                          fontSize: 10,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: tabTitles.length,
              itemBuilder: (context, index) {
                return _buildContent(index);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.88,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    '1 item added',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'View all ^',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => Packers(),
                        builder: (context) => AddOnsPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Confirm items",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return _buildLivingRoomContent();
      case 1:
        return _buildBedroomContent();
      case 2:
        return _buildKitchenContent();
      case 3:
        return _buildOthersContent();
      default:
        return Container();
    }
  }

  Widget _buildLivingRoomContent() {
    return ContentSection(
      title: "Living Room",
      items: [
        ItemData(
            icon: Icons.chair,
            text: "Chairs",
            subItems: ["Dining Chair", "Armchair", "Office Chair"]),
        ItemData(
            icon: Icons.table_chart,
            text: "Tables",
            subItems: ["Coffee Table", "Dining Table", "Side Table"]),
        ItemData(
            icon: Icons.tv,
            text: "TV/Monitor",
            subItems: ["Smart TV", "Monitor"]),
        ItemData(
            icon: Icons.weekend,
            text: "Cabinet/Storage",
            subItems: ["Bookshelf", "Display Cabinet"]),
        ItemData(
            icon: Icons.deck,
            text: "Sofa",
            subItems: ["Two-Seater", "Three-Seater", "Corner Sofa"]),
        ItemData(
            icon: Icons.home,
            text: "Home Utility",
            subItems: ["Lamp", "Decorations"]),
      ],
    );
  }

  Widget _buildBedroomContent() {
    return ContentSection(
      title: "Bedroom",
      items: [
        ItemData(
            icon: Icons.table_chart,
            text: "Tables",
            subItems: ["Nightstand", "Dressing Table"]),
        ItemData(
            icon: Icons.chair, text: "Chairs", subItems: ["Bedroom Chair"]),
        ItemData(
            icon: Icons.bed,
            text: "Mattress",
            subItems: ["Single", "Double", "Queen", "King"]),
        ItemData(
            icon: Icons.bed,
            text: "Bed Frame",
            subItems: ["Single", "Double", "Queen", "King"]),
        ItemData(
            icon: Icons.ac_unit,
            text: "AC/Cooler/Fan",
            subItems: ["AC", "Fan"]),
        ItemData(
            icon: Icons.weekend,
            text: "Cabinet/Storage",
            subItems: ["Drawers", "Shelves"]),
        ItemData(
            icon: Icons.desk_outlined,
            text: "Almirah/Wardrobe",
            subItems: ["Two-Door", "Three-Door"]),
      ],
    );
  }

  Widget _buildKitchenContent() {
    return ContentSection(
      title: "Kitchen",
      items: [
        ItemData(
            icon: Icons.kitchen,
            text: "Fridge",
            subItems: ["Single Door", "Double Door"]),
        ItemData(
            icon: Icons.electrical_services,
            text: "Electrical/Gas Appliances",
            subItems: ["Oven", "Microwave", "Stove"]),
        ItemData(
            icon: Icons.weekend,
            text: "Cabinet/Storage",
            subItems: ["Wall Cabinet", "Base Cabinet"]),
      ],
    );
  }

  Widget _buildOthersContent() {
    return ContentSection(
      title: "Others",
      items: [
        ItemData(icon: Icons.inventory, text: "Self Carton Box", subItems: []),
        ItemData(
            icon: Icons.inventory, text: "Porter Carton Box", subItems: []),
        ItemData(icon: Icons.shopping_bag, text: "Gunny Bag", subItems: []),
        ItemData(
            icon: Icons.local_laundry_service,
            text: "Washing Machine",
            subItems: []),
        ItemData(icon: Icons.bathtub, text: "Bathroom Utility", subItems: []),
        ItemData(icon: Icons.home, text: "Home Utility", subItems: []),
        ItemData(icon: Icons.directions_car, text: "Vehicle", subItems: []),
      ],
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

class ContentSection extends StatefulWidget {
  final String title;
  final List<ItemData> items;

  ContentSection({required this.title, required this.items});

  @override
  _ContentSectionState createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  List<bool> _isExpanded = [];
  Map<String, int> _itemCounts = {};

  @override
  void initState() {
    super.initState();
    _isExpanded = List.generate(widget.items.length, (index) => false);
    for (var item in widget.items) {
      _itemCounts[item.text] = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return ItemRow(
                item: widget.items[index],
                isExpanded: _isExpanded[index],
                itemCount: _itemCounts[widget.items[index].text] ?? 0,
                onExpandedChanged: (bool expanded) {
                  setState(() {
                    _isExpanded[index] = expanded;
                  });
                },
                onCountChanged: (int count) {
                  setState(() {
                    _itemCounts[widget.items[index].text] = count;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final ItemData item;
  final bool isExpanded;
  final int itemCount;
  final Function(bool) onExpandedChanged;
  final Function(int) onCountChanged;

  ItemRow({
    required this.item,
    required this.isExpanded,
    required this.itemCount,
    required this.onExpandedChanged,
    required this.onCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(item.icon, color: Colors.grey[600]),
                    SizedBox(width: 16),
                    Text(item.text, style: TextStyle(fontSize: 16)),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    onExpandedChanged(!isExpanded);
                  },
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Column(
            children: item.subItems
                .map((subItem) => SubItemRow(
                      subItemText: subItem,
                      onCountChanged: onCountChanged,
                      itemCount: itemCount,
                      mainItemText: item.text,
                    ))
                .toList(),
          ),
      ],
    );
  }
}

class SubItemRow extends StatelessWidget {
  final String subItemText;
  final Function(int) onCountChanged;
  final int itemCount;
  final String mainItemText;

  SubItemRow({
    required this.subItemText,
    required this.onCountChanged,
    required this.itemCount,
    required this.mainItemText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(subItemText),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  onCountChanged(itemCount > 0 ? itemCount - 1 : itemCount);
                },
              ),
              Text('$itemCount'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  onCountChanged(itemCount + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemData {
  final IconData icon;
  final String text;
  final List<String> subItems;

  ItemData({required this.icon, required this.text, required this.subItems});
}
