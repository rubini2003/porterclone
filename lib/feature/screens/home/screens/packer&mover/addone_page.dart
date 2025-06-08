import 'package:flutter/material.dart';
import 'package:porter_clone/feature/screens/home/screens/packer&mover/Review_page.dart';

class AddOnsPage extends StatefulWidget {
  const AddOnsPage({super.key});

  @override
  State<AddOnsPage> createState() => _AddOnsPageState();
}

class _AddOnsPageState extends State<AddOnsPage> {
  int currentStep = 2;
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Base price',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      // SizedBox(height: 8),
                      Text(
                        '₹2,279',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 4),
                      Text('Friendly and professional movers'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 4),
                      Text('Loading and unloading included'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('View more', style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 20),
                  Text('Recommended add-ons',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  AddOnItem(title: 'Single-layer packing'),
                  AddOnItem(title: 'Multi-layer packing'),
                  AddOnItem(
                    title: 'Unpacking all the packed items',
                    description: 'Unpacking of all items packed by us',
                    price: '₹199',
                  ),
                  AddOnItem(
                      title: 'Dismantling and reassembly of basic furniture'),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('₹2,279',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('1 item added', style: TextStyle(color: Colors.grey)),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Review booking',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ));
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

class AddOnItem extends StatelessWidget {
  const AddOnItem({
    super.key,
    required this.title,
    this.description,
    this.price,
  });

  final String title;
  final String? description;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                if (description != null)
                  Text(
                    '$price  $description',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                if (description == null && price != null)
                  Text(
                    '$price',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.blue[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(80, 36), // Correct usage
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
// class AddOnsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Add Ons Page", style: TextStyle(fontSize: 20)),
//     );
//   }
// }
